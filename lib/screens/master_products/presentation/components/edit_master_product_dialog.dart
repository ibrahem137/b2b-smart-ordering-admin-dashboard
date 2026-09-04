import 'dart:typed_data';

import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/update_product_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_state.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMasterProductDialog extends StatefulWidget {
  final MasterProductModel product;

  const EditMasterProductDialog({super.key, required this.product});

  @override
  State<EditMasterProductDialog> createState() =>
      _EditMasterProductDialogState();
}

class _EditMasterProductDialogState extends State<EditMasterProductDialog> {
  static const int _maxImageSize = 5 * 1024 * 1024;

  static const List<String> _allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _buyPriceController;
  late final TextEditingController _stockController;

  late int selectedSupplierId;
  late int selectedCategoryId;
  late String selectedStatus;

  Uint8List? _newImageBytes;
  String? _newImageFileName;
  String? _imageError;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<UpdateProductCubit, ProductActionState>(
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

                    _buildImageSection(),

                    const SizedBox(height: 20),

                    _buildName(),

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

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.product.name);

    _descriptionController = TextEditingController(
      text: widget.product.description ?? '',
    );

    _buyPriceController = TextEditingController(text: widget.product.buyPrice);

    _stockController = TextEditingController(
      text: widget.product.stockQuantity.toString(),
    );

    selectedSupplierId = widget.product.supplierId;
    selectedCategoryId = widget.product.categoryId;
    selectedStatus = widget.product.status;
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
            child: Text('common.cancel'.tr()),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FilledButton(
            onPressed: isLoading ? null : _save,
            child: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.onPrimary,
                    ),
                  )
                : Text('master_products.save_changes'.tr()),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyPrice() {
    return TextFormField(
      controller: _buyPriceController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: _decoration(context, 'master_products.buy_price'.tr()),
      validator: (value) {
        final price = double.tryParse(value ?? '');

        if (price == null || price < 0) {
          return 'master_products.invalid_price'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildCategory() {
    return BlocBuilder<SupplierCategoriesCubit, SupplierCategoriesState>(
      builder: (context, supplierState) {
        if (supplierState is SupplierCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (supplierState is SupplierCategoriesFailure) {
          return Text(
            supplierState.message,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          );
        }

        if (supplierState is SupplierCategoriesSuccess) {
          return BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, categoriesState) {
              if (categoriesState is CategoriesSuccess) {
                final allowed = categoriesState.categories
                    .where(
                      (category) =>
                          supplierState.categoryIds.contains(category.id),
                    )
                    .toList();

                final categoryExists = allowed.any(
                  (category) => category.id == selectedCategoryId,
                );

                return DropdownButtonFormField<int>(
                  initialValue: categoryExists ? selectedCategoryId : null,
                  decoration: _decoration(
                    context,
                    'master_products.category'.tr(),
                  ),
                  dropdownColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHigh,
                  items: allowed
                      .map(
                        (category) => DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
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

              if (categoriesState is CategoriesFailure) {
                return Text(
                  categoriesState.message,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                );
              }

              return const SizedBox();
            },
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 3,
      decoration: _decoration(context, 'master_products.description'.tr()),
    );
  }

  Widget _buildExistingImage(String imageUrl) {
    final colors = Theme.of(context).colorScheme;

    return Image.network(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildImagePlaceholder(
          icon: Icons.broken_image_outlined,
          iconColor: colors.onSurfaceVariant,
        );
      },
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
          child: Icon(Icons.edit_outlined, color: colors.onPrimaryContainer),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            'master_products.edit_product'.tr(),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder({
    IconData icon = Icons.image_outlined,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: iconColor ?? colors.onSurfaceVariant),
          const SizedBox(height: 8),
          Text(
            'master_products.no_image'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final hasNewImage = _newImageBytes != null;

    final existingImageUrl = widget.product.imageUrl?.trim();

    final hasExistingImage =
        existingImageUrl != null && existingImageUrl.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'master_products.image'.tr(),
          style: theme.textTheme.titleSmall?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _imageError != null ? colors.error : colors.outlineVariant,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: hasNewImage
              ? _buildNewImagePreview()
              : hasExistingImage
              ? _buildExistingImage(existingImageUrl)
              : _buildImagePlaceholder(),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.upload_outlined),
                label: Text(
                  hasNewImage
                      ? 'master_products.change_image'.tr()
                      : 'master_products.select_image'.tr(),
                ),
              ),
            ),

            if (hasNewImage) ...[
              const SizedBox(width: 10),
              IconButton(
                tooltip: 'common.remove'.tr(),
                onPressed: _removeNewImage,
                icon: const Icon(Icons.close),
              ),
            ],
          ],
        ),

        if (_newImageFileName != null) ...[
          const SizedBox(height: 8),
          Text(
            _newImageFileName!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],

        if (_imageError != null) ...[
          const SizedBox(height: 8),
          Text(
            _imageError!,
            style: theme.textTheme.bodySmall?.copyWith(color: colors.error),
          ),
        ],

        const SizedBox(height: 6),

        Text(
          'master_products.image_update_hint'.tr(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: _nameController,
      decoration: _decoration(context, 'master_products.product_name'.tr()),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'master_products.required'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildNewImagePreview() {
    final colors = Theme.of(context).colorScheme;

    return Image.memory(
      _newImageBytes!,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildImagePlaceholder(
          icon: Icons.broken_image_outlined,
          iconColor: colors.error,
        );
      },
    );
  }

  Widget _buildStatus() {
    return DropdownButtonFormField<String>(
      initialValue: selectedStatus,
      decoration: _decoration(context, 'master_products.status'.tr()),
      dropdownColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      items: [
        DropdownMenuItem(
          value: 'available',
          child: Text('master_products.available'.tr()),
        ),
        DropdownMenuItem(
          value: 'unavailable',
          child: Text('master_products.unavailable'.tr()),
        ),
        DropdownMenuItem(
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
      decoration: _decoration(context, 'master_products.stock_quantity'.tr()),
      validator: (value) {
        final stock = int.tryParse(value ?? '');

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
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuppliersFailure) {
          return Text(
            state.message,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          );
        }

        if (state is SuppliersSuccess) {
          final supplierExists = state.suppliers.any(
            (supplier) => supplier.id == selectedSupplierId,
          );

          return DropdownButtonFormField<int>(
            initialValue: supplierExists ? selectedSupplierId : null,
            decoration: _decoration(context, 'master_products.supplier'.tr()),
            dropdownColor: Theme.of(context).colorScheme.surfaceContainerHigh,
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
                selectedCategoryId = -1;
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

        return const SizedBox();
      },
    );
  }

  InputDecoration _decoration(BuildContext context, String label) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      labelText: label,
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

  Future<void> _pickImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
      allowMultiple: false,
      withData: true,
    );

    if (!mounted || result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.single;

    final extension = file.extension?.toLowerCase();

    if (extension == null || !_allowedExtensions.contains(extension)) {
      setState(() {
        _imageError = 'master_products.invalid_image_format'.tr();
      });

      return;
    }

    if (file.size > _maxImageSize) {
      setState(() {
        _imageError = 'master_products.image_too_large'.tr();
      });

      return;
    }

    final bytes = file.bytes;

    if (bytes == null || bytes.isEmpty) {
      setState(() {
        _imageError = 'master_products.image_read_error'.tr();
      });

      return;
    }

    setState(() {
      _newImageBytes = bytes;
      _newImageFileName = file.name;
      _imageError = null;
    });
  }

  void _removeNewImage() {
    setState(() {
      _newImageBytes = null;
      _newImageFileName = null;
      _imageError = null;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedCategoryId <= 0) {
      return;
    }

    if (_imageError != null) {
      return;
    }

    MultipartFile? image;

    if (_newImageBytes != null && _newImageFileName != null) {
      image = MultipartFile.fromBytes(
        _newImageBytes!,
        filename: _newImageFileName!,
      );
    }

    context.read<UpdateProductCubit>().updateProduct(
      id: widget.product.id,
      supplierId: selectedSupplierId,
      categoryId: selectedCategoryId,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      buyPrice: double.parse(_buyPriceController.text.trim()),
      stockQuantity: int.parse(_stockController.text.trim()),
      status: selectedStatus,

      // null = keep the current backend image.
      // MultipartFile = replace it.
      image: image,
    );
  }
}
