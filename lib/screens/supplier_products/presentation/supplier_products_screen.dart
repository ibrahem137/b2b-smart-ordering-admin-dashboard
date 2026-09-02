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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierProductsScreen extends StatelessWidget {
  const SupplierProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupplierProductsCubit>(
      create: (_) => getIt<SupplierProductsCubit>()..getSupplierProducts(),
      child: const _SupplierProductsView(),
    );
  }
}

class _DeleteSupplierOfferDialog extends StatelessWidget {
  final SupplierProductModel offer;

  const _DeleteSupplierOfferDialog({required this.offer});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<DeleteSupplierProductCubit, SupplierProductActionState>(
      listener: (context, state) {
        if (state is SupplierProductActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is SupplierProductActionFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is SupplierProductActionLoading;

        return AlertDialog(
          title: const Text('Delete Supplier Offer'),
          content: Text(
            'Are you sure you want to delete '
            '"${offer.product?.name ?? 'this offer'}"?',
          ),
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
                      context
                          .read<DeleteSupplierProductCubit>()
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
                  : const Text('Delete'),
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
  State<_SupplierProductsView> createState() => _SupplierProductsViewState();
}

class _SupplierProductsViewState extends State<_SupplierProductsView> {
  String _selectedFilter = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
              child: BlocBuilder<SupplierProductsCubit, SupplierProductsState>(
                builder: (context, state) {
                  if (state is SupplierProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SupplierProductsFailure) {
                    return _buildFailureState(context, state);
                  }

                  if (state is SupplierProductsSuccess) {
                    final filteredProducts = _filterLocally(
                      state.supplierProducts,
                    );

                    return SupplierProductsTable(
                      products: filteredProducts,
                      onEdit: (product) async {
                        await _openEditOfferDialog(context, product);
                      },
                      onDelete: (product) async {
                        final deleted = await showDialog<bool>(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return BlocProvider<DeleteSupplierProductCubit>(
                              create: (_) =>
                                  getIt<DeleteSupplierProductCubit>(),
                              child: _DeleteSupplierOfferDialog(offer: product),
                            );
                          },
                        );

                        if (deleted == true && context.mounted) {
                          context
                              .read<SupplierProductsCubit>()
                              .getSupplierProducts(
                                status: _statusFromFilter(_selectedFilter),
                              );
                        }
                      },
                    );
                  }

                  return const SizedBox();
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
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 40, color: colors.error),
          const SizedBox(height: 12),
          Text(state.message, style: TextStyle(color: colors.onSurface)),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {
              context.read<SupplierProductsCubit>().getSupplierProducts(
                status: _statusFromFilter(_selectedFilter),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
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
      final productName = offer.product?.name.toLowerCase() ?? '';

      final supplierName = offer.supplier?.name.toLowerCase() ?? '';

      final categoryName = offer.product?.category?.name.toLowerCase() ?? '';

      return productName.contains(query) ||
          supplierName.contains(query) ||
          categoryName.contains(query);
    }).toList();
  }

  void _onFilterChanged(BuildContext context, String value) {
    setState(() {
      _selectedFilter = value;
    });

    String? status;

    switch (value) {
      case 'Available':
        status = 'available';
        break;

      case 'Unavailable':
        status = 'unavailable';
        break;

      case 'Archived':
        status = 'archived';
        break;

      case 'All':
      default:
        status = null;
        break;
    }

    context.read<SupplierProductsCubit>().getSupplierProducts(status: status);
  }

  Future<void> _openAddOfferDialog(BuildContext context) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CreateSupplierProductCubit>(
              create: (_) => getIt<CreateSupplierProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) => getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<ProductsCubit>(
              create: (_) => getIt<ProductsCubit>()..getProducts(),
            ),
          ],
          child: const AddSupplierOfferDialog(),
        );
      },
    );

    if (created == true && context.mounted) {
      context.read<SupplierProductsCubit>().getSupplierProducts(
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
              create: (_) => getIt<UpdateSupplierProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) => getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<ProductsCubit>(
              create: (_) => getIt<ProductsCubit>()..getProducts(),
            ),
          ],
          child: EditSupplierOfferDialog(offer: offer),
        );
      },
    );

    if (updated == true && context.mounted) {
      context.read<SupplierProductsCubit>().getSupplierProducts(
        status: _statusFromFilter(_selectedFilter),
      );
    }
  }

  String? _statusFromFilter(String filter) {
    switch (filter) {
      case 'Available':
        return 'available';

      case 'Unavailable':
        return 'unavailable';

      case 'Archived':
        return 'archived';

      default:
        return null;
    }
  }
}
