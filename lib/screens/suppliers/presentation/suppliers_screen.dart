import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:dashboard/screens/suppliers/presentation/components/add_supplier_dialog.dart';
import 'package:dashboard/screens/suppliers/presentation/components/edit_supplier_dialog.dart';
import 'package:dashboard/screens/suppliers/presentation/components/suppliers_header.dart';
import 'package:dashboard/screens/suppliers/presentation/components/suppliers_table.dart';
import 'package:dashboard/screens/suppliers/presentation/components/suppliers_tool_bar.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/create_supplier_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/delete_supplier_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_suppliers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuppliersCubit>(
      create: (_) => getIt<SuppliersCubit>()..getSuppliers(),
      child: const _SuppliersView(),
    );
  }
}

class _DeleteSupplierDialog extends StatelessWidget {
  final SupplierModel supplier;

  const _DeleteSupplierDialog({required this.supplier});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<DeleteSupplierCubit, SupplierActionState>(
      listener: (context, state) {
        if (state is SupplierActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is SupplierActionFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is SupplierActionLoading;

        return AlertDialog(
          title: const Text('Delete Supplier'),
          content: Text('Are you sure you want to delete "${supplier.name}"?'),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () {
                      context.read<DeleteSupplierCubit>().deleteSupplier(
                        supplier.id,
                      );
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
                  : const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class _SuppliersView extends StatefulWidget {
  const _SuppliersView();

  @override
  State<_SuppliersView> createState() => _SuppliersViewState();
}

class _SuppliersViewState extends State<_SuppliersView> {
  final TextEditingController _searchController = TextEditingController();

  int _activeCount = 0;
  int _inactiveCount = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SuppliersHeader(
              onAddSupplier: () async {
                await _openAddSupplierDialog(context);
              },
            ),

            const SizedBox(height: 24),

            BlocListener<SuppliersCubit, SuppliersState>(
              listener: (context, state) {
                if (state is SuppliersSuccess) {
                  final activeCount = state.suppliers
                      .where((supplier) => supplier.isActive)
                      .length;

                  setState(() {
                    _activeCount = activeCount;
                    _inactiveCount = state.suppliers.length - activeCount;
                  });
                }
              },
              child: SuppliersToolbar(
                searchController: _searchController,
                activeSuppliers: _activeCount,
                inactiveSuppliers: _inactiveCount,
                onSearchChanged: (value) {
                  context.read<SuppliersCubit>().getSuppliers(
                    search: value.trim(),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BlocBuilder<SuppliersCubit, SuppliersState>(
                builder: (context, state) {
                  if (state is SuppliersLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    );
                  }

                  if (state is SuppliersFailure) {
                    return _buildFailureState(context, state);
                  }

                  if (state is SuppliersSuccess) {
                    return SuppliersTable(
                      suppliers: state.suppliers,
                      onEdit: (supplier) async {
                        await _openEditSupplierDialog(context, supplier);
                      },
                      onDelete: (supplier) async {
                        await _openDeleteSupplierDialog(context, supplier);
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildFailureState(BuildContext context, SuppliersFailure state) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: colors.error, size: 40),
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
              context.read<SuppliersCubit>().getSuppliers(
                search: _searchController.text.trim(),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _openAddSupplierDialog(BuildContext context) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CreateSupplierCubit>(
              create: (_) => getIt<CreateSupplierCubit>(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (_) => getIt<CategoriesCubit>()..getCategories(),
            ),
            BlocProvider<UpdateSupplierCategoriesCubit>(
              create: (_) => getIt<UpdateSupplierCategoriesCubit>(),
            ),
          ],
          child: const AddSupplierDialog(),
        );
      },
    );

    if (created == true && context.mounted) {
      _refreshSuppliers(context);
    }
  }

  Future<void> _openDeleteSupplierDialog(
    BuildContext context,
    SupplierModel supplier,
  ) async {
    final deleted = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return BlocProvider<DeleteSupplierCubit>(
          create: (_) => getIt<DeleteSupplierCubit>(),
          child: _DeleteSupplierDialog(supplier: supplier),
        );
      },
    );

    if (deleted == true && context.mounted) {
      _refreshSuppliers(context);
    }
  }

  Future<void> _openEditSupplierDialog(
    BuildContext context,
    SupplierModel supplier,
  ) async {
    final updated = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpdateSupplierCubit>(
              create: (_) => getIt<UpdateSupplierCubit>(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (_) => getIt<CategoriesCubit>()..getCategories(),
            ),
            BlocProvider<SupplierCategoriesCubit>(
              create: (_) =>
                  getIt<SupplierCategoriesCubit>()
                    ..getSupplierCategories(supplier.id),
            ),
            BlocProvider<UpdateSupplierCategoriesCubit>(
              create: (_) => getIt<UpdateSupplierCategoriesCubit>(),
            ),
          ],
          child: EditSupplierDialog(supplier: supplier),
        );
      },
    );

    if (updated == true && context.mounted) {
      _refreshSuppliers(context);
    }
  }

  void _refreshSuppliers(BuildContext context) {
    context.read<SuppliersCubit>().getSuppliers(
      search: _searchController.text.trim(),
    );
  }
}
