import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/create_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMasterProductDialog extends StatefulWidget {
  const AddMasterProductDialog({super.key});

  @override
  State<AddMasterProductDialog> createState() => _AddMasterProductDialogState();
}

class _AddMasterProductDialogState extends State<AddMasterProductDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _buyPriceController = TextEditingController();
  final _stockController = TextEditingController(text: '0');

  int? selectedSupplierId;
  int? selectedCategoryId;

  String selectedStatus = 'available';

  List<CategoryModel> supplierCategories = [];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateProductCubit, ProductActionState>(
          listener: (context, state) {
            if (state is ProductActionSuccess) {
              debugPrint('PRODUCT CREATED SUCCESSFULLY');
              Navigator.pop(context, true);
            }

            if (state is ProductActionFailure) {
              _showErrorSnackBar(context, state.message);
            }
          },
        ),
        BlocListener<SupplierCategoriesCubit, SupplierCategoriesState>(
          listener: (context, state) {
            if (state is SupplierCategoriesSuccess) {
              setState(() {
                selectedCategoryId = null;
              });
            }

            if (state is SupplierCategoriesFailure) {
              _showErrorSnackBar(context, state.message);
            }
          },
        ),
      ],
      child: BlocBuilder<CreateProductCubit, ProductActionState>(
        builder: (context, createState) {
          final isLoading = createState is ProductActionLoading;

          return Dialog(
            backgroundColor: colors.surface,
            surfaceTintColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colors.outlineVariant),
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

                      _buildNameField(context),

                      const SizedBox(height: 20),

                      _buildSupplierDropdown(context),

                      const SizedBox(height: 20),

                      _buildCategoryDropdown(context),

                      const SizedBox(height: 20),

                      _buildDescriptionField(context),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(child: _buildBuyPriceField(context)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildStockField(context)),
                        ],
                      ),

                      const SizedBox(height: 20),

                      _buildStatusDropdown(context),

                      const SizedBox(height: 32),

                      _buildActions(context, isLoading),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _buyPriceController.dispose();
    _stockController.dispose();

    super.dispose();
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
              foregroundColor: colors.primary,
              padding: const EdgeInsets.all(20),
              side: BorderSide(color: colors.outline),
            ),
            child: const Text('Cancel'),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: FilledButton(
            onPressed: isLoading ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              padding: const EdgeInsets.all(20),
            ),
            child: isLoading
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.onPrimary,
                    ),
                  )
                : const Text('Add Product'),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyPriceField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Buy Price *'),

        const SizedBox(height: 8),

        TextFormField(
          controller: _buyPriceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: _inputDecoration(context, '0.00'),
          validator: (value) {
            final price = double.tryParse(value ?? '');

            if (price == null) {
              return 'Invalid price';
            }

            if (price < 0) {
              return 'Price cannot be negative';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Category *'),

        const SizedBox(height: 8),

        BlocBuilder<SupplierCategoriesCubit, SupplierCategoriesState>(
          builder: (context, state) {
            if (selectedSupplierId == null) {
              return DropdownButtonFormField<int>(
                items: const [],
                onChanged: null,
                decoration: _inputDecoration(context, 'Select supplier first'),
              );
            }

            if (state is SupplierCategoriesLoading) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: CircularProgressIndicator(color: colors.primary),
                ),
              );
            }

            if (state is SupplierCategoriesFailure) {
              return Text(state.message, style: TextStyle(color: colors.error));
            }

            if (state is SupplierCategoriesSuccess) {
              final ids = state.categoryIds;

              if (ids.isEmpty) {
                return Text(
                  'This supplier has no categories.',
                  style: TextStyle(color: colors.error),
                );
              }

              return _SupplierCategoryDropdown(
                categoryIds: ids,
                value: selectedCategoryId,
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildDescriptionField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Description'),

        const SizedBox(height: 8),

        TextFormField(
          controller: _descriptionController,
          maxLines: 3,
          decoration: _inputDecoration(context, 'Enter product description'),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Text(
      label,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Icons.production_quantity_limits_outlined,
            color: colors.onPrimaryContainer,
            size: 26,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Product',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Create a new master product.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        IconButton(
          tooltip: 'Close',
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Product Name *'),

        const SizedBox(height: 8),

        TextFormField(
          controller: _nameController,
          decoration: _inputDecoration(context, 'Enter product name'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Required';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStatusDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Status'),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: selectedStatus,
          decoration: _inputDecoration(context, 'Select status'),
          items: const [
            DropdownMenuItem(value: 'available', child: Text('Available')),
            DropdownMenuItem(value: 'unavailable', child: Text('Unavailable')),
            DropdownMenuItem(value: 'archived', child: Text('Archived')),
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

  Widget _buildStockField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Stock Quantity'),

        const SizedBox(height: 8),

        TextFormField(
          controller: _stockController,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration(context, '0'),
          validator: (value) {
            final stock = int.tryParse(value ?? '');

            if (stock == null) {
              return 'Invalid quantity';
            }

            if (stock < 0) {
              return 'Cannot be negative';
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSupplierDropdown(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context, 'Supplier *'),

        const SizedBox(height: 8),

        BlocBuilder<SuppliersCubit, SuppliersState>(
          builder: (context, state) {
            if (state is SuppliersLoading) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }

            if (state is SuppliersFailure) {
              return Text(state.message, style: TextStyle(color: colors.error));
            }

            if (state is SuppliersSuccess) {
              return DropdownButtonFormField<int>(
                initialValue: selectedSupplierId,
                decoration: _inputDecoration(context, 'Select supplier'),
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
                    selectedCategoryId = null;
                  });

                  if (value != null) {
                    context
                        .read<SupplierCategoriesCubit>()
                        .getSupplierCategories(value);
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a supplier';
                  }

                  return null;
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(BuildContext context, String hint) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: colors.onSurfaceVariant),
      filled: true,
      fillColor: colors.surface,

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.primary, width: 1.5),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: colors.outlineVariant.withValues(alpha: .6),
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.error, width: 1.5),
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedSupplierId == null) {
      return;
    }

    if (selectedCategoryId == null) {
      final colors = Theme.of(context).colorScheme;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: colors.error,
          content: Text(
            'Please select a category.',
            style: TextStyle(color: colors.onError),
          ),
        ),
      );

      return;
    }

    final buyPrice = double.parse(_buyPriceController.text);

    final stockQuantity = int.parse(_stockController.text);

    debugPrint('========== CREATE PRODUCT ==========');
    debugPrint('SUPPLIER ID: $selectedSupplierId');
    debugPrint('CATEGORY ID: $selectedCategoryId');
    debugPrint('NAME: ${_nameController.text}');
    debugPrint('BUY PRICE: $buyPrice');
    debugPrint('STOCK: $stockQuantity');
    debugPrint('STATUS: $selectedStatus');

    context.read<CreateProductCubit>().createProduct(
      supplierId: selectedSupplierId!,
      categoryId: selectedCategoryId!,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      buyPrice: buyPrice,
      stockQuantity: stockQuantity,
      status: selectedStatus,
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    final colors = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colors.error,
        content: Text(message, style: TextStyle(color: colors.onError)),
      ),
    );
  }
}

class _SupplierCategoryDropdown extends StatelessWidget {
  final List<int> categoryIds;
  final int? value;
  final ValueChanged<int?> onChanged;

  const _SupplierCategoryDropdown({
    required this.categoryIds,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(
            child: CircularProgressIndicator(color: colors.primary),
          );
        }

        if (state is CategoriesFailure) {
          return Text(state.message, style: TextStyle(color: colors.error));
        }

        if (state is CategoriesSuccess) {
          final categories = state.categories
              .where((category) => categoryIds.contains(category.id))
              .toList();

          if (categories.isEmpty) {
            return Text(
              'No categories available for this supplier.',
              style: TextStyle(color: colors.error),
            );
          }

          return DropdownButtonFormField<int>(
            initialValue: value,
            decoration: InputDecoration(
              hintText: 'Select category',
              filled: true,
              fillColor: colors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
            ),
            items: categories
                .map(
                  (category) => DropdownMenuItem<int>(
                    value: category.id,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            validator: (value) {
              if (value == null) {
                return 'Please select a category';
              }

              return null;
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
