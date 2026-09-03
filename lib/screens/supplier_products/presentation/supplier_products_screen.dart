import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/add_supplier_offer_dialog.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/edit_supplier_offer_dialog.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/supplier_products_header.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/supplier_products_table.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/supplier_products_toolbar.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/create_supplier_product_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/delete_supplier_product_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/update_supplier_product_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierProductsScreen extends StatelessWidget {
  const SupplierProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupplierProductsCubit>(
      create: (_) =>
          getIt<SupplierProductsCubit>()
            ..getSupplierProducts(),
      child: const _SupplierProductsView(),
    );
  }
}

class _DeleteSupplierOfferDialog extends StatelessWidget {
  final SupplierProductModel offer;

  const _DeleteSupplierOfferDialog({required this.offer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<
      DeleteSupplierProductCubit,
      SupplierProductActionState
    >(
      listener: (context, state) {
        if (state is SupplierProductActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is SupplierProductActionFailure) {
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
        final isLoading =
            state is SupplierProductActionLoading;

        final productName =
            offer.product?.name ??
            'supplier_products.this_offer'.tr();

        return AlertDialog(
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colors.outlineVariant),
          ),
          title: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colors.error.withValues(
                    alpha: .10,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: colors.error,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'supplier_products.delete_offer'.tr(),
                  style: theme.textTheme.titleLarge
                      ?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          content: Text(
            'supplier_products.delete_confirmation'.tr(
              namedArgs: {'name': productName},
            ),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
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
                          .read<
                            DeleteSupplierProductCubit
                          >()
                          .deleteSupplierProduct(offer.id);
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

class _SupplierProductsView extends StatefulWidget {
  const _SupplierProductsView();

  @override
  State<_SupplierProductsView> createState() =>
      _SupplierProductsViewState();
}

class _SupplierProductsViewState
    extends State<_SupplierProductsView> {
  String _selectedFilter = 'all';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SupplierProductsHeader(
              onAddOffer: () async {
                await _openAddOfferDialog(context);
              },
            ),

            const SizedBox(height: 24),

            SupplierProductsToolbar(
              selectedFilter: _selectedFilter,
              onSearch: (value) {
                setState(() {
                  _searchQuery = value.trim();
                });
              },
              onFilterChanged: (value) {
                _onFilterChanged(context, value);
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child:
                  BlocBuilder<
                    SupplierProductsCubit,
                    SupplierProductsState
                  >(
                    builder: (context, state) {
                      if (state
                          is SupplierProductsLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                          ),
                        );
                      }

                      if (state
                          is SupplierProductsFailure) {
                        return _buildFailureState(
                          context,
                          state,
                        );
                      }

                      if (state
                          is SupplierProductsSuccess) {
                        final filteredProducts =
                            _filterLocally(
                              state.supplierProducts,
                            );

                        return SupplierProductsTable(
                          products: filteredProducts,
                          onEdit: (product) async {
                            await _openEditOfferDialog(
                              context,
                              product,
                            );
                          },
                          onDelete: (product) async {
                            final deleted = await showDialog<bool>(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return BlocProvider<
                                  DeleteSupplierProductCubit
                                >(
                                  create: (_) =>
                                      getIt<
                                        DeleteSupplierProductCubit
                                      >(),
                                  child:
                                      _DeleteSupplierOfferDialog(
                                        offer: product,
                                      ),
                                );
                              },
                            );

                            if (deleted == true &&
                                context.mounted) {
                              context
                                  .read<
                                    SupplierProductsCubit
                                  >()
                                  .getSupplierProducts(
                                    status:
                                        _statusFromFilter(
                                          _selectedFilter,
                                        ),
                                  );
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
    SupplierProductsFailure state,
  ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: .10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: 34,
              color: colors.error,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'supplier_products.unable_to_load'.tr(),
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            state.message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: () {
              context
                  .read<SupplierProductsCubit>()
                  .getSupplierProducts(
                    status: _statusFromFilter(
                      _selectedFilter,
                    ),
                  );
            },
            icon: const Icon(Icons.refresh),
            label: Text('common.retry'.tr()),
          ),
        ],
      ),
    );
  }

  List<SupplierProductModel> _filterLocally(
    List<SupplierProductModel> products,
  ) {
    if (_searchQuery.isEmpty) {
      return products;
    }

    final query = _searchQuery.toLowerCase();

    return products.where((offer) {
      final productName =
          offer.product?.name.toLowerCase() ?? '';

      final supplierName =
          offer.supplier?.name.toLowerCase() ?? '';

      final categoryName =
          offer.product?.category?.name.toLowerCase() ?? '';

      return productName.contains(query) ||
          supplierName.contains(query) ||
          categoryName.contains(query);
    }).toList();
  }

  void _onFilterChanged(
    BuildContext context,
    String value,
  ) {
    setState(() {
      _selectedFilter = value;
    });

    context
        .read<SupplierProductsCubit>()
        .getSupplierProducts(
          status: _statusFromFilter(value),
        );
  }

  Future<void> _openAddOfferDialog(
    BuildContext context,
  ) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CreateSupplierProductCubit>(
              create: (_) =>
                  getIt<CreateSupplierProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) =>
                  getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<ProductsCubit>(
              create: (_) =>
                  getIt<ProductsCubit>()..getProducts(),
            ),
          ],
          child: const AddSupplierOfferDialog(),
        );
      },
    );

    if (created == true && context.mounted) {
      context
          .read<SupplierProductsCubit>()
          .getSupplierProducts(
            status: _statusFromFilter(_selectedFilter),
          );
    }
  }

  Future<void> _openEditOfferDialog(
    BuildContext context,
    SupplierProductModel offer,
  ) async {
    final updated = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpdateSupplierProductCubit>(
              create: (_) =>
                  getIt<UpdateSupplierProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) =>
                  getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<ProductsCubit>(
              create: (_) =>
                  getIt<ProductsCubit>()..getProducts(),
            ),
          ],
          child: EditSupplierOfferDialog(offer: offer),
        );
      },
    );

    if (updated == true && context.mounted) {
      context
          .read<SupplierProductsCubit>()
          .getSupplierProducts(
            status: _statusFromFilter(_selectedFilter),
          );
    }
  }

  String? _statusFromFilter(String filter) {
    switch (filter) {
      case 'available':
        return 'available';

      case 'unavailable':
        return 'unavailable';

      case 'archived':
        return 'archived';

      case 'all':
      default:
        return null;
    }
  }
}
