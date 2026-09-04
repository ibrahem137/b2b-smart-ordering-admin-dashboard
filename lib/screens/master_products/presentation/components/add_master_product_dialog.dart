import 'dart:typed_data';

import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/create_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMasterProductDialog extends StatefulWidget {
  const AddMasterProductDialog({super.key});
  @override
  State<AddMasterProductDialog> createState() => _AddMasterProductDialogState();
}

class _AddMasterProductDialogState extends State<AddMasterProductDialog> {
  static const int _maxImageSize = 5 * 1024 * 1024;
  static const Set<String> _allowedImageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'webp',
  };
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _buyPriceController = TextEditingController();
  final _stockController = TextEditingController();
  int? selectedSupplierId;
  int? selectedCategoryId;
  String selectedStatus = 'available';
  Uint8List? _imageBytes;
  String? _imageFileName;
  String? _imageError;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocConsumer<CreateProductCubit, ProductActionState>(
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
        return Dialog(
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
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
                    _buildName(),
                    const SizedBox(height: 20),
                    _buildProductImage(),
                    const SizedBox(height: 20),
                    _buildSupplier(),
                    const SizedBox(height: 20),
                    _buildCategory(),
                    const SizedBox(height: 20),
                    _buildDescription(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _buildBuyPrice()),
                        const SizedBox(width: 12),
                        Expanded(child: _buildStock()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildStatus(),
                    const SizedBox(height: 30),
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
    _nameController.dispose();
    _descriptionController.dispose();
    _buyPriceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Widget _buildActions(BuildContext context, bool isLoading) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: isLoading
              ? null
              : () {
                  Navigator.pop(context);
                },
          child: Text('common.cancel'.tr()),
        ),
        const SizedBox(width: 12),
        FilledButton.icon(
          onPressed: isLoading ? null : _save,
          icon: isLoading
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.onPrimary,
                  ),
                )
              : const Icon(Icons.add, size: 18),
          label: Text(
            isLoading
                ? 'master_products.creating'.tr()
                : 'master_products.add_product'.tr(),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyPrice() {
    return TextFormField(
      controller: _buyPriceController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      decoration: _decoration(
        context,
        'master_products.buy_price'.tr(),
        hintText: '0.00',
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'master_products.buy_price_required'.tr();
        }
        final price = double.tryParse(value.trim());
        if (price == null || price < 0) {
          return 'master_products.invalid_price'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildCategory() {
    if (selectedSupplierId == null) {
      return DropdownButtonFormField<int>(
        initialValue: null,
        isExpanded: true,
        decoration: _decoration(
          context,
          'master_products.category'.tr(),
          hintText: 'master_products.select_supplier_first'.tr(),
        ),
        items: const [],
        onChanged: null,
        validator: (_) {
          if (selectedSupplierId == null) {
            return 'master_products.select_supplier_first_validation'.tr();
          }
          return null;
        },
      );
    }
    return BlocBuilder<SupplierCategoriesCubit, SupplierCategoriesState>(
      builder: (context, supplierState) {
        if (supplierState is SupplierCategoriesLoading) {
          return _buildLoadingField(context, 'master_products.category'.tr());
        }
        if (supplierState is SupplierCategoriesFailure) {
          return _buildErrorField(
            context,
            label: 'master_products.category'.tr(),
            message: supplierState.message,
          );
        }
        if (supplierState is SupplierCategoriesSuccess) {
          return BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, categoriesState) {
              if (categoriesState is CategoriesLoading) {
                return _buildLoadingField(
                  context,
                  'master_products.category'.tr(),
                );
              }
              if (categoriesState is CategoriesFailure) {
                return _buildErrorField(
                  context,
                  label: 'master_products.category'.tr(),
                  message: categoriesState.message,
                );
              }
              if (categoriesState is CategoriesSuccess) {
                final allowedCategories = categoriesState.categories.where((
                  category,
                ) {
                  return supplierState.categoryIds.contains(category.id);
                }).toList();
                if (allowedCategories.isEmpty) {
                  return _buildEmptyCategoryField(context);
                }
                final categoryExists = allowedCategories.any(
                  (category) => category.id == selectedCategoryId,
                );
                return DropdownButtonFormField<int>(
                  initialValue: categoryExists ? selectedCategoryId : null,
                  isExpanded: true,
                  decoration: _decoration(
                    context,
                    'master_products.category'.tr(),
                    hintText: 'master_products.select_category'.tr(),
                  ),
                  dropdownColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHigh,
                  items: allowedCategories.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(
                        category.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategoryId = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'master_products.select_category_validation'.tr();
                    }
                    return null;
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 3,
      decoration: _decoration(
        context,
        'master_products.description'.tr(),
        hintText: 'master_products.description_hint'.tr(),
      ),
    );
  }

  Widget _buildEmptyCategoryField(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InputDecorator(
      decoration: _decoration(context, 'master_products.category'.tr()),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: colors.onSurfaceVariant),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'master_products.no_supplier_categories'.tr(),
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorField(
    BuildContext context, {
    required String label,
    required String message,
  }) {
    final colors = Theme.of(context).colorScheme;
    return InputDecorator(
      decoration: _decoration(context, label).copyWith(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colors.error),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 18, color: colors.error),
          const SizedBox(width: 10),
          Expanded(
            child: Text(message, style: TextStyle(color: colors.error)),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: colors.primaryContainer,
          child: Icon(Icons.add_box_outlined, color: colors.onPrimaryContainer),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'master_products.add_product'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'master_products.add_product_subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'common.close'.tr(),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: colors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.memory(_imageBytes!, fit: BoxFit.contain),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            tooltip: 'master_products.remove_image'.tr(),
            onPressed: _removeProductImage,
            icon: const Icon(Icons.close),
            style: IconButton.styleFrom(
              backgroundColor: colors.surface,
              foregroundColor: colors.onSurface,
              side: BorderSide(color: colors.outlineVariant),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadState() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.cloud_upload_outlined, size: 36, color: colors.primary),
        const SizedBox(height: 10),
        Text(
          'master_products.upload_product_image'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'master_products.image_upload_hint'.tr(),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingField(BuildContext context, String label) {
    final colors = Theme.of(context).colorScheme;
    return InputDecorator(
      decoration: _decoration(context, label),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'common.loading'.tr(),
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: _nameController,
      textInputAction: TextInputAction.next,
      decoration: _decoration(
        context,
        'master_products.product_name'.tr(),
        hintText: 'master_products.product_name_hint'.tr(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'master_products.product_name_required'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildProductImage() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'master_products.product_image'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickProductImage,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _imageError == null
                    ? colors.outlineVariant
                    : colors.error,
                width: 1.5,
              ),
            ),
            child: _imageBytes == null
                ? _buildImageUploadState()
                : _buildImagePreview(),
          ),
        ),
        if (_imageError != null) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              _imageError!,
              style: theme.textTheme.bodySmall?.copyWith(color: colors.error),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStatus() {
    return DropdownButtonFormField<String>(
      initialValue: selectedStatus,
      isExpanded: true,
      decoration: _decoration(context, 'master_products.status'.tr()),
      dropdownColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      items: [
        DropdownMenuItem<String>(
          value: 'available',
          child: Text('master_products.available'.tr()),
        ),
        DropdownMenuItem<String>(
          value: 'unavailable',
          child: Text('master_products.unavailable'.tr()),
        ),
        DropdownMenuItem<String>(
          value: 'archived',
          child: Text('master_products.archived'.tr()),
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
    );
  }

  Widget _buildStock() {
    return TextFormField(
      controller: _stockController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: _decoration(
        context,
        'master_products.stock_quantity'.tr(),
        hintText: '0',
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'master_products.stock_required'.tr();
        }
        final stock = int.tryParse(value.trim());
        if (stock == null || stock < 0) {
          return 'master_products.invalid_stock'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildSupplier() {
    return BlocBuilder<SuppliersCubit, SuppliersState>(
      builder: (context, state) {
        if (state is SuppliersLoading) {
          return _buildLoadingField(context, 'master_products.supplier'.tr());
        }
        if (state is SuppliersFailure) {
          return _buildErrorField(
            context,
            label: 'master_products.supplier'.tr(),
            message: state.message,
          );
        }
        if (state is SuppliersSuccess) {
          return DropdownButtonFormField<int>(
            initialValue: selectedSupplierId,
            isExpanded: true,
            decoration: _decoration(
              context,
              'master_products.supplier'.tr(),
              hintText: 'master_products.select_supplier'.tr(),
            ),
            dropdownColor: Theme.of(context).colorScheme.surfaceContainerHigh,
            items: state.suppliers.map((supplier) {
              return DropdownMenuItem<int>(
                value: supplier.id,
                child: Text(
                  supplier.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                selectedSupplierId = value;
                selectedCategoryId = null;
              });
              context.read<SupplierCategoriesCubit>().getSupplierCategories(
                value,
              );
            },
            validator: (value) {
              if (value == null) {
                return 'master_products.select_supplier_validation'.tr();
              }
              return null;
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  InputDecoration _decoration(
    BuildContext context,
    String label, {
    String? hintText,
  }) {
    final colors = Theme.of(context).colorScheme;
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      filled: true,
      fillColor: colors.surfaceContainerLowest,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors.primary, width: 1.5),
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

  Future<void> _pickProductImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['jpg', 'jpeg', 'png', 'webp'],
      allowMultiple: false,
      withData: true,
    );

    if (result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.single;
    final bytes = file.bytes;
    final extension = file.extension?.toLowerCase();

    if (extension == null || !_allowedImageExtensions.contains(extension)) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'master_products.invalid_image_format'.tr();
      });
      return;
    }

    if (file.size > _maxImageSize) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'master_products.image_too_large'.tr();
      });
      return;
    }

    if (bytes == null) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'master_products.image_read_error'.tr();
      });
      return;
    }

    setState(() {
      _imageBytes = bytes;
      _imageFileName = file.name;
      _imageError = null;
    });
  }

  void _removeProductImage() {
    setState(() {
      _imageBytes = null;
      _imageFileName = null;
      _imageError = 'master_products.image_required'.tr();
    });
  }

  void _save() {
    final isFormValid = _formKey.currentState!.validate();
    if (_imageBytes == null || _imageFileName == null) {
      setState(() {
        _imageError = 'master_products.image_required'.tr();
      });
    }
    if (!isFormValid ||
        _imageBytes == null ||
        _imageFileName == null ||
        selectedSupplierId == null ||
        selectedCategoryId == null) {
      return;
    }
    final image = MultipartFile.fromBytes(
      _imageBytes!,
      filename: _imageFileName!,
    );
    context.read<CreateProductCubit>().createProduct(
      supplierId: selectedSupplierId!,
      categoryId: selectedCategoryId!,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      buyPrice: double.parse(_buyPriceController.text.trim()),
      stockQuantity: int.parse(_stockController.text.trim()),
      status: selectedStatus,
      image: image,
    );
  }
}
