import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';
import 'package:dashboard/screens/master_products/presentation/components/add_master_product_dialog.dart';
import 'package:dashboard/screens/master_products/presentation/components/edit_master_product_dialog.dart';
import 'package:dashboard/screens/master_products/presentation/components/master_products_header.dart';
import 'package:dashboard/screens/master_products/presentation/components/master_products_table.dart';
import 'package:dashboard/screens/master_products/presentation/components/master_products_toolbar.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/create_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/delete_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_state.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/update_product_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterProductsScreen extends StatelessWidget {
  const MasterProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) => getIt<ProductsCubit>()..getProducts(),
      child: const _MasterProductsView(),
    );
  }
}

class _DeleteProductDialog extends StatelessWidget {
  final MasterProductModel product;

  const _DeleteProductDialog({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<
      DeleteProductCubit,
      ProductActionState
    >(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is ProductActionFailure) {
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
        final isLoading = state is ProductActionLoading;

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
                  'master_products.delete_product'.tr(),
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
            'master_products.delete_confirmation'.tr(
              args: [product.name],
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
                          .read<DeleteProductCubit>()
                          .deleteProduct(product.id);
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

class _MasterProductsView extends StatelessWidget {
  const _MasterProductsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MasterProductsHeader(
                  onAddProduct: () async {
                    await _openAddProduct(context);
                  },
                ),
                const SizedBox(height: 24),
                MasterProductsToolbar(
                  totalProducts: state is ProductsSuccess
                      ? state.products.length
                      : 0,
                  onSearch: (value) {
                    context
                        .read<ProductsCubit>()
                        .getProducts(search: value.trim());
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: _buildContent(context, state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProductsState state,
  ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    if (state is ProductsLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: colors.primary,
        ),
      );
    }

    if (state is ProductsFailure) {
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
                color: colors.error,
                size: 34,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'master_products.unable_to_load_products'
                  .tr(),
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
                context.read<ProductsCubit>().getProducts();
              },
              icon: const Icon(Icons.refresh),
              label: Text('common.retry'.tr()),
            ),
          ],
        ),
      );
    }

    if (state is ProductsSuccess) {
      if (state.products.isEmpty) {
        return _buildEmptyState(context);
      }

      return MasterProductsTable(
        products: state.products,
        onEdit: (product) async {
          await _openEditProduct(context, product);
        },
        onDelete: (product) async {
          final deleted = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return BlocProvider<DeleteProductCubit>(
                create: (_) => getIt<DeleteProductCubit>(),
                child: _DeleteProductDialog(
                  product: product,
                ),
              );
            },
          );

          if (deleted == true && context.mounted) {
            context.read<ProductsCubit>().getProducts();
          }
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: .10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: colors.primary,
              size: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'master_products.no_products_found'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'master_products.products_empty_description'
                .tr(),
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openAddProduct(BuildContext context) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CreateProductCubit>(
              create: (_) => getIt<CreateProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) =>
                  getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<SupplierCategoriesCubit>(
              create: (_) =>
                  getIt<SupplierCategoriesCubit>(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (_) =>
                  getIt<CategoriesCubit>()..getCategories(),
            ),
          ],
          child: const AddMasterProductDialog(),
        );
      },
    );

    if (created == true && context.mounted) {
      context.read<ProductsCubit>().getProducts();
    }
  }

  Future<void> _openEditProduct(
    BuildContext context,
    MasterProductModel product,
  ) async {
    final updated = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpdateProductCubit>(
              create: (_) => getIt<UpdateProductCubit>(),
            ),
            BlocProvider<SuppliersCubit>(
              create: (_) =>
                  getIt<SuppliersCubit>()..getSuppliers(),
            ),
            BlocProvider<SupplierCategoriesCubit>(
              create: (_) =>
                  getIt<SupplierCategoriesCubit>()
                    ..getSupplierCategories(
                      product.supplierId,
                    ),
            ),
            BlocProvider<CategoriesCubit>(
              create: (_) =>
                  getIt<CategoriesCubit>()..getCategories(),
            ),
          ],
          child: EditMasterProductDialog(product: product),
        );
      },
    );

    if (updated == true && context.mounted) {
      context.read<ProductsCubit>().getProducts();
    }
  }
}
