import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_state.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/custom_dropdown.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/update_supplier_product_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSupplierOfferDialog extends StatefulWidget {
  final SupplierProductModel offer;

  const EditSupplierOfferDialog({super.key, required this.offer});

  @override
  State<EditSupplierOfferDialog> createState() =>
      _EditSupplierOfferDialogState();
}

class _EditSupplierOfferDialogState extends State<EditSupplierOfferDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _priceController;
  late final TextEditingController _stockController;

  late int selectedSupplierId;
  late int selectedProductId;
  late String selectedStatus;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<UpdateSupplierProductCubit, SupplierProductActionState>(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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

    _priceController = TextEditingController(text: widget.offer.buyPrice);

    _stockController = TextEditingController(
      text: widget.offer.stockQuantity.toString(),
    );
  }

  Widget _buildActions(BuildContext context, bool isLoading) {
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
            child: const Text('Cancel'),
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
                : const Text('Save Changes'),
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
          child: Icon(Icons.edit_outlined, color: colors.onPrimary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Supplier Offer',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Update supplier product offering.',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buy Price *',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: _inputDecoration(context, '0.00'),
          validator: (value) {
            final price = double.tryParse(value?.trim() ?? '');

            if (price == null) {
              return 'Enter a valid price';
            }

            if (price <= 0) {
              return 'Price must be greater than zero';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildProduct() {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Product *', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductsFailure) {
              return Text(state.message, style: TextStyle(color: colors.error));
            }

            if (state is ProductsSuccess) {
              return CustomDropdown<int>(
                hint: 'Select product',
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
                    return 'Please select product';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Status', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        CustomDropdown<String>(
          hint: 'Select status',
          value: selectedStatus,
          items: const [
            DropdownMenuItem<String>(
              value: 'available',
              child: Text('Available'),
            ),
            DropdownMenuItem<String>(
              value: 'unavailable',
              child: Text('Unavailable'),
            ),
            DropdownMenuItem<String>(
              value: 'archived',
              child: Text('Archived'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stock Quantity *',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _stockController,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration(context, '0'),
          validator: (value) {
            final stock = int.tryParse(value?.trim() ?? '');

            if (stock == null) {
              return 'Enter a valid stock quantity';
            }

            if (stock < 0) {
              return 'Stock cannot be negative';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSupplier() {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Supplier *', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        BlocBuilder<SuppliersCubit, SuppliersState>(
          builder: (context, state) {
            if (state is SuppliersLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SuppliersFailure) {
              return Text(state.message, style: TextStyle(color: colors.error));
            }

            if (state is SuppliersSuccess) {
              return CustomDropdown<int>(
                hint: 'Select supplier',
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
                    return 'Please select supplier';
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

  InputDecoration _inputDecoration(BuildContext context, String hint) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: colors.surface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colors.error, width: 1.5),
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.tryParse(_priceController.text.trim());

    final stock = int.tryParse(_stockController.text.trim());

    if (price == null || stock == null) {
      return;
    }

    context.read<UpdateSupplierProductCubit>().updateSupplierProduct(
      id: widget.offer.id,
      supplierId: selectedSupplierId,
      productId: selectedProductId,
      buyPrice: price,
      stockQuantity: stock,
      status: selectedStatus,
    );
  }
}
