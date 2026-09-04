import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:dashboard/screens/stores/presentation/components/add_store_dialog.dart';
import 'package:dashboard/screens/stores/presentation/components/change_store_status_dialog.dart';
import 'package:dashboard/screens/stores/presentation/components/store_details_dialog.dart';
import 'package:dashboard/screens/stores/presentation/components/stores_header.dart';
import 'package:dashboard/screens/stores/presentation/components/stores_table.dart';
import 'package:dashboard/screens/stores/presentation/components/stores_toolbar.dart';
import 'package:dashboard/screens/stores/presentation/cubit/create_store_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/delete_store_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/delete_store_state.dart';
import 'package:dashboard/screens/stores/presentation/cubit/stores_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/stores_state.dart';
import 'package:dashboard/screens/stores/presentation/cubit/update_store_status_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StoresCubit>()..getStores(),
      child: const _StoresView(),
    );
  }
}

class _DeleteStoreDialog extends StatelessWidget {
  final StoreModel store;

  const _DeleteStoreDialog({required this.store});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<DeleteStoreCubit, DeleteStoreState>(
      listener: (context, state) {
        switch (state) {
          case DeleteStoreSuccess():
            Navigator.of(context).pop(true);

          case DeleteStoreFailure(:final message):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colors.error,
                content: Text(message, style: TextStyle(color: colors.onError)),
              ),
            );

          default:
            break;
        }
      },
      builder: (context, state) {
        final isLoading = state is DeleteStoreLoading;

        return AlertDialog(
          backgroundColor: colors.surface,
          title: Text('stores.delete_store'.tr()),
          content: Text(
            'stores.delete_confirmation'.tr(namedArgs: {'name': store.name}),
          ),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.of(context).pop(false);
                    },
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              onPressed: isLoading
                  ? null
                  : () {
                      context.read<DeleteStoreCubit>().deleteStore(store.id);
                    },
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

class _StoresErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _StoresErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: colors.error),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: colors.error),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text('common.retry'.tr()),
          ),
        ],
      ),
    );
  }
}

class _StoresView extends StatefulWidget {
  const _StoresView();

  @override
  State<_StoresView> createState() => _StoresViewState();
}

class _StoresViewState extends State<_StoresView> {
  String _search = '';
  String? _status;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<StoresCubit, StoresState>(
            buildWhen: (previous, current) {
              return previous != current;
            },
            builder: (context, state) {
              final totalStores = switch (state) {
                StoresSuccess(:final total) => total,
                _ => 0,
              };

              return StoresHeader(
                totalStores: totalStores,
                onAddStore: () async {
                  final created = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return BlocProvider(
                        create: (_) => getIt<CreateStoreCubit>(),
                        child: const AddStoreDialog(),
                      );
                    },
                  );

                  if (created == true && context.mounted) {
                    _loadStores();
                  }
                },
              );
            },
          ),

          const SizedBox(height: 24),

          StoresToolbar(
            selectedStatus: _status,
            onSearchChanged: (value) {
              _search = value;
              _loadStores();
            },
            onStatusChanged: (value) {
              setState(() {
                _status = value;
              });

              _loadStores();
            },
            onRefresh: _loadStores,
          ),

          const SizedBox(height: 20),

          Expanded(
            child: BlocBuilder<StoresCubit, StoresState>(
              builder: (context, state) {
                return switch (state) {
                  StoresInitial() || StoresLoading() => Center(
                    child: CircularProgressIndicator(color: colors.primary),
                  ),

                  StoresSuccess(:final stores) => StoresTable(
                    stores: stores,

                    onView: (StoreModel store) {
                      showDialog<void>(
                        context: context,
                        builder: (_) {
                          return StoreDetailsDialog(store: store);
                        },
                      );
                    },

                    onToggleStatus: (StoreModel store) async {
                      final changed = await showDialog<bool>(
                        context: context,
                        builder: (_) {
                          return BlocProvider(
                            create: (_) => getIt<UpdateStoreStatusCubit>(),
                            child: ChangeStoreStatusDialog(store: store),
                          );
                        },
                      );

                      if (changed == true && context.mounted) {
                        _loadStores();
                      }
                    },

                    onDelete: (StoreModel store) async {
                      final deleted = await showDialog<bool>(
                        context: context,
                        builder: (_) {
                          return BlocProvider(
                            create: (_) => getIt<DeleteStoreCubit>(),
                            child: _DeleteStoreDialog(store: store),
                          );
                        },
                      );

                      if (deleted == true && context.mounted) {
                        _loadStores();
                      }
                    },
                  ),

                  StoresFailure(:final message) => _StoresErrorView(
                    message: message,
                    onRetry: _loadStores,
                  ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  void _loadStores() {
    context.read<StoresCubit>().getStores(
      search: _search.trim().isEmpty ? null : _search.trim(),
      status: _status,
    );
  }
}
