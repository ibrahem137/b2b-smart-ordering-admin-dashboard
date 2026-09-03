import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/categories/presentation/components/add_category_dialog.dart';
import 'package:dashboard/screens/categories/presentation/components/categories_grid.dart';
import 'package:dashboard/screens/categories/presentation/components/categories_header.dart';
import 'package:dashboard/screens/categories/presentation/components/edit_category_dialog.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';
import 'package:dashboard/screens/categories/presentation/cubit/create_category_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/delete_category_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/update_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (_) =>
          getIt<CategoriesCubit>()..getCategories(),
      child: const _CategoriesView(),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesHeader(
              onAddCategory: () async {
                await _openAddCategoryDialog(context);
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                      ),
                    );
                  }

                  if (state is CategoriesFailure) {
                    return _buildFailureState(
                      context,
                      state,
                    );
                  }

                  if (state is CategoriesSuccess) {
                    if (state.categories.isEmpty) {
                      return Center(
                        child: Text(
                          'categories.no_categories_found'
                              .tr(),
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(
                                color:
                                    colors.onSurfaceVariant,
                              ),
                        ),
                      );
                    }

                    return CategoriesGrid(
                      categories: state.categories,
                      onEdit: (category) async {
                        final updated =
                            await showDialog<bool>(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return BlocProvider<
                                  UpdateCategoryCubit
                                >(
                                  create: (_) =>
                                      getIt<
                                        UpdateCategoryCubit
                                      >(),
                                  child: EditCategoryDialog(
                                    category: category,
                                  ),
                                );
                              },
                            );

                        if (updated == true &&
                            context.mounted) {
                          context
                              .read<CategoriesCubit>()
                              .getCategories();
                        }
                      },
                      onDelete: (category) async {
                        final deleted =
                            await showDialog<bool>(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return BlocProvider<
                                  DeleteCategoryCubit
                                >(
                                  create: (_) =>
                                      getIt<
                                        DeleteCategoryCubit
                                      >(),
                                  child:
                                      _DeleteCategoryDialog(
                                        category: category,
                                      ),
                                );
                              },
                            );

                        if (deleted == true &&
                            context.mounted) {
                          context
                              .read<CategoriesCubit>()
                              .getCategories();
                        }
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFailureState(
    BuildContext context,
    CategoriesFailure state,
  ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            color: colors.error,
            size: 40,
          ),

          const SizedBox(height: 12),

          Text(
            state.message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 16),

          FilledButton.icon(
            onPressed: () {
              context
                  .read<CategoriesCubit>()
                  .getCategories();
            },
            icon: const Icon(Icons.refresh),
            label: Text('common.retry'.tr()),
          ),
        ],
      ),
    );
  }

  Future<void> _openAddCategoryDialog(
    BuildContext context,
  ) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return BlocProvider<CreateCategoryCubit>(
          create: (_) => getIt<CreateCategoryCubit>(),
          child: const AddCategoryDialog(),
        );
      },
    );

    if (created == true && context.mounted) {
      context.read<CategoriesCubit>().getCategories();
    }
  }
}

class _DeleteCategoryDialog extends StatelessWidget {
  final CategoryModel category;

  const _DeleteCategoryDialog({required this.category});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<
      DeleteCategoryCubit,
      CategoryActionState
    >(
      listener: (context, state) {
        if (state is CategoryActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is CategoryActionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colors.error,
              content: Text(
                state.message,
                style: TextStyle(color: colors.onError),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is CategoryActionLoading;

        return AlertDialog(
          title: Text('categories.delete_category'.tr()),
          content: Text(
            'categories.delete_confirmation'.tr(
              namedArgs: {'name': category.name},
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () {
                      context
                          .read<DeleteCategoryCubit>()
                          .deleteCategory(category.id);
                    },
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              child: isLoading
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.onError,
                      ),
                    )
                  : Text('common.delete'.tr()),
            ),
          ],
        );
      },
    );
  }
}
