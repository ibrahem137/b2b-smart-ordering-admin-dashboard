import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_state.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/custom_dropdown.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/update_supplier_product_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSupplierOfferDialog extends StatefulWidget {
  final SupplierProductModel offer;

  const EditSupplierOfferDialog({
    super.key,
    required this.offer,
  });

  @override
  State<EditSupplierOfferDialog> createState() =>
      _EditSupplierOfferDialogState();
}

class _EditSupplierOfferDialogState
    extends State<EditSupplierOfferDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _priceController;

  late final TextEditingController _stockController;

  late int selectedSupplierId;

  late int selectedProductId;

  late String selectedStatus;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<
      UpdateSupplierProductCubit,
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

                    _buildProduct(),

                    const SizedBox(height: 18),

                    _buildSupplier(),

                    const SizedBox(height: 18),

                    _buildPrice(),

                    const SizedBox(height: 18),

                    _buildStock(),

                    const SizedBox(height: 18),

                    _buildStatus(),

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

  @override
  void initState() {
    super.initState();

    selectedSupplierId = widget.offer.supplierId;

    selectedProductId = widget.offer.productId;

    selectedStatus = widget.offer.status;

    _priceController = TextEditingController(
      text: widget.offer.buyPrice,
    );

    _stockController = TextEditingController(
      text: widget.offer.stockQuantity.toString(),
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
            onPressed: isLoading
                ? null
                : () {
                    Navigator.pop(context);
                  },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              side: BorderSide(color: colors.primary),
              foregroundColor: colors.primary,
            ),
            child: Text('common.cancel'.tr()),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: FilledButton(
            onPressed: isLoading ? null : _save,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
            ),
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
                    'supplier_products.actions.save_changes'
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
            Icons.edit_outlined,
            color: colors.onPrimary,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'supplier_products.edit_dialog.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      fontSize: 22,
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 4),

              Text(
                'supplier_products.edit_dialog.subtitle'
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

  Widget _buildPrice() {
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
          decoration: _inputDecoration(context, '0.00'),
          validator: (value) {
            final price = double.tryParse(
              value?.trim() ?? '',
            );

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

  Widget _buildProduct() {
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
              return Text(
                state.message,
                style: TextStyle(color: colors.error),
              );
            }

            if (state is ProductsSuccess) {
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
                  if (value == null) {
                    return;
                  }

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

  Widget _buildStatus() {
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

  Widget _buildStock() {
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
          decoration: _inputDecoration(context, '0'),
          validator: (value) {
            final stock = int.tryParse(value?.trim() ?? '');

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

  Widget _buildSupplier() {
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
              return Text(
                state.message,
                style: TextStyle(color: colors.error),
              );
            }

            if (state is SuppliersSuccess) {
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
                  if (value == null) {
                    return;
                  }

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
    BuildContext context,
    String hint,
  ) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: colors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.outlineVariant,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.5,
        ),
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.tryParse(
      _priceController.text.trim(),
    );

    final stock = int.tryParse(
      _stockController.text.trim(),
    );

    if (price == null || stock == null) {
      return;
    }

    context
        .read<UpdateSupplierProductCubit>()
        .updateSupplierProduct(
          id: widget.offer.id,
          supplierId: selectedSupplierId,
          productId: selectedProductId,
          buyPrice: price,
          stockQuantity: stock,
          status: selectedStatus,
        );
  }
}
