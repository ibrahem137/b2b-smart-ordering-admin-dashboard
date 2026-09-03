import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/custom_dropdown.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/create_supplier_product_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSupplierOfferDialog extends StatefulWidget {
  const AddSupplierOfferDialog({super.key});

  @override
  State<AddSupplierOfferDialog> createState() =>
      _AddSupplierOfferDialogState();
}

class _AddSupplierOfferDialogState
    extends State<AddSupplierOfferDialog> {
  final _formKey = GlobalKey<FormState>();

  final _priceController = TextEditingController();

  final _stockController = TextEditingController(text: '0');

  int? selectedProductId;

  int? selectedSupplierId;

  String selectedStatus = 'available';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<
      CreateSupplierProductCubit,
      SupplierProductActionState
    >(
      listener: (context, state) {
        if (state is SupplierProductActionSuccess) {
          debugPrint('SUPPLIER OFFER CREATED SUCCESSFULLY');

          Navigator.pop(context, true);
        }

        if (state is SupplierProductActionFailure) {
          debugPrint(
            'CREATE SUPPLIER OFFER FAILED: '
            '${state.message}',
          );

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

        return Dialog(
          backgroundColor: colors.surface,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 650,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),

                    const SizedBox(height: 30),

                    _buildProductField(),

                    const SizedBox(height: 18),

                    _buildSupplierField(),

                    const SizedBox(height: 18),

                    _buildPriceField(),

                    const SizedBox(height: 18),

                    _buildStockField(),

                    const SizedBox(height: 18),

                    _buildStatusField(),

                    const SizedBox(height: 32),

                    _buildActions(context, isLoading),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    _stockController.dispose();

    super.dispose();
  }

  void saveOffer() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedProductId == null ||
        selectedSupplierId == null) {
      final colors = Theme.of(context).colorScheme;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: colors.error,
          content: Text(
            'supplier_products.validation.select_product_and_supplier'
                .tr(),
            style: TextStyle(
              color: colors.onError,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      return;
    }

    final buyPrice = double.tryParse(
      _priceController.text.trim(),
    );

    final stockQuantity = int.tryParse(
      _stockController.text.trim(),
    );

    if (buyPrice == null || stockQuantity == null) {
      return;
    }

    debugPrint(
      '========== CREATE SUPPLIER OFFER ==========',
    );

    debugPrint('SUPPLIER ID: $selectedSupplierId');

    debugPrint('PRODUCT ID: $selectedProductId');

    debugPrint('BUY PRICE: $buyPrice');

    debugPrint('STOCK: $stockQuantity');

    debugPrint('STATUS: $selectedStatus');

    context
        .read<CreateSupplierProductCubit>()
        .createSupplierProduct(
          supplierId: selectedSupplierId!,
          productId: selectedProductId!,
          buyPrice: buyPrice,
          stockQuantity: stockQuantity,
          status: selectedStatus,
        );
  }

  Widget _buildActions(
    BuildContext context,
    bool isLoading,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              side: BorderSide(color: colors.primary),
              foregroundColor: colors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isLoading
                ? null
                : () {
                    Navigator.pop(context);
                  },
            child: Text(
              'common.cancel'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
            ),
            onPressed: isLoading ? null : saveOffer,
            child: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.onPrimary,
                    ),
                  )
                : Text(
                    'supplier_products.actions.add_offer'
                        .tr(),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: colors.primary,
          child: Icon(
            Icons.production_quantity_limits_outlined,
            color: colors.onPrimary,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'supplier_products.add_dialog.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      fontSize: 22,
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 4),

              Text(
                'supplier_products.add_dialog.subtitle'
                    .tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'supplier_products.fields.buy_price_required'
              .tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: _priceController,
          keyboardType:
              const TextInputType.numberWithOptions(
                decimal: true,
              ),
          decoration: _inputDecoration(
            context,
            hint: '0.00',
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'supplier_products.validation.required'
                  .tr();
            }

            final price = double.tryParse(value.trim());

            if (price == null) {
              return 'supplier_products.validation.invalid_price'
                  .tr();
            }

            if (price <= 0) {
              return 'supplier_products.validation.price_greater_than_zero'
                  .tr();
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildProductField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'supplier_products.fields.product_required'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductsFailure) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(color: colors.error),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<ProductsCubit>()
                          .getProducts();
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text('common.retry'.tr()),
                  ),
                ],
              );
            }

            if (state is ProductsSuccess) {
              if (state.products.isEmpty) {
                return Text(
                  'supplier_products.empty.no_products'
                      .tr(),
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                  ),
                );
              }

              return CustomDropdown<int>(
                hint:
                    'supplier_products.hints.select_product'
                        .tr(),
                value: selectedProductId,
                items: state.products
                    .map(
                      (product) => DropdownMenuItem<int>(
                        value: product.id,
                        child: Text(product.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProductId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'supplier_products.validation.select_product'
                        .tr();
                  }

                  return null;
                },
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildStatusField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'common.status'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        CustomDropdown<String>(
          hint: 'supplier_products.hints.select_status'
              .tr(),
          value: selectedStatus,
          items: [
            DropdownMenuItem<String>(
              value: 'available',
              child: Text(
                'supplier_products.status.available'.tr(),
              ),
            ),
            DropdownMenuItem<String>(
              value: 'unavailable',
              child: Text(
                'supplier_products.status.unavailable'.tr(),
              ),
            ),
            DropdownMenuItem<String>(
              value: 'archived',
              child: Text(
                'supplier_products.status.archived'.tr(),
              ),
            ),
          ],
          onChanged: (value) {
            if (value == null) {
              return;
            }

            setState(() {
              selectedStatus = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStockField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'supplier_products.fields.stock_quantity_required'
              .tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: _stockController,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration(context, hint: '0'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'supplier_products.validation.required'
                  .tr();
            }

            final stock = int.tryParse(value.trim());

            if (stock == null) {
              return 'supplier_products.validation.invalid_stock'
                  .tr();
            }

            if (stock < 0) {
              return 'supplier_products.validation.stock_cannot_be_negative'
                  .tr();
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSupplierField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'supplier_products.fields.supplier_required'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        BlocBuilder<SuppliersCubit, SuppliersState>(
          builder: (context, state) {
            if (state is SuppliersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SuppliersFailure) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(color: colors.error),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<SuppliersCubit>()
                          .getSuppliers();
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text('common.retry'.tr()),
                  ),
                ],
              );
            }

            if (state is SuppliersSuccess) {
              if (state.suppliers.isEmpty) {
                return Text(
                  'supplier_products.empty.no_suppliers'
                      .tr(),
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                  ),
                );
              }

              return CustomDropdown<int>(
                hint: 'supplier_products.hints.select_supplier'
                    .tr(),
                value: selectedSupplierId,
                items: state.suppliers
                    .map(
                      (supplier) => DropdownMenuItem<int>(
                        value: supplier.id,
                        child: Text(supplier.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSupplierId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'supplier_products.validation.select_supplier'
                        .tr();
                  }

                  return null;
                },
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String hint,
  }) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hint,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: colors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: colors.outlineVariant,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
