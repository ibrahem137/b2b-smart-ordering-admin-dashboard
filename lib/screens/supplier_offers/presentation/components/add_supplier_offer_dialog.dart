import 'dart:typed_data';

import 'package:dashboard/screens/supplier_offers/presentation/cubit/create_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/custom_dropdown.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_state.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
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
  static const int _maxImageSize = 5 * 1024 * 1024;

  static const Set<String> _allowedImageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'webp',
  };

  final _formKey = GlobalKey<FormState>();

  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _expiresAtController = TextEditingController();

  int? _selectedSupplierProductId;

  String _selectedStatus = 'available';

  Uint8List? _imageBytes;
  String? _imageFileName;
  String? _imageError;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<
      CreateSupplierOfferCubit,
      SupplierOfferActionState
    >(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            Navigator.of(context).pop(true);
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colors.error,
                content: Text(
                  message,
                  style: TextStyle(color: colors.onError),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Dialog(
          backgroundColor: colors.surface,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: 680,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 28),

                    _buildSupplierProductField(),
                    const SizedBox(height: 18),

                    _buildOfferPriceField(),
                    const SizedBox(height: 18),

                    _buildOfferStockField(),
                    const SizedBox(height: 18),

                    _buildStatusField(),
                    const SizedBox(height: 18),

                    _buildExpiresAtField(),
                    const SizedBox(height: 18),

                    _buildImageField(),
                    const SizedBox(height: 30),

                    _buildActions(isLoading),
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
    _expiresAtController.dispose();
    super.dispose();
  }

  Widget _buildActions(bool isLoading) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(18),
              foregroundColor: colors.primary,
              side: BorderSide(color: colors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isLoading
                ? null
                : () {
                    Navigator.of(context).pop(false);
                  },
            child: Text('common.cancel'.tr()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(18),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
                : Text(
                    'supplier_offers.add_offer'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpiresAtField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.expires_at'.tr()),
        const SizedBox(height: 8),
        TextFormField(
          controller: _expiresAtController,
          readOnly: true,
          decoration:
              _inputDecoration(
                hint: 'common.optional'.tr(),
                prefixIcon: Icons.event_outlined,
              ).copyWith(
                suffixIcon:
                    _expiresAtController.text.isNotEmpty
                    ? IconButton(
                        tooltip: 'common.clear'.tr(),
                        onPressed: () {
                          setState(() {
                            _expiresAtController.clear();
                          });
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
              ),
          onTap: _pickExpirationDate,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: colors.primary,
          child: Icon(
            Icons.local_offer_outlined,
            color: colors.onPrimary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'supplier_offers.add_title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'supplier_offers.add_subtitle'.tr(),
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

  Widget _buildImageField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.offer_image'.tr()),
        const SizedBox(height: 4),
        Text(
          'supplier_offers.image_optional_hint'.tr(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: _pickImage,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
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
          Text(
            _imageError!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.error,
            ),
          ),
        ],
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
            child: Image.memory(
              _imageBytes!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            tooltip: 'supplier_offers.remove_image'.tr(),
            onPressed: _removeImage,
            icon: const Icon(Icons.close),
            style: IconButton.styleFrom(
              backgroundColor: colors.surface,
              foregroundColor: colors.onSurface,
              side: BorderSide(
                color: colors.outlineVariant,
              ),
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
        Icon(
          Icons.cloud_upload_outlined,
          size: 42,
          color: colors.primary,
        ),
        const SizedBox(height: 10),
        Text(
          'supplier_offers.choose_image'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'supplier_offers.image_formats'.tr(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildOfferPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(
          'supplier_offers.offer_price_required'.tr(),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _priceController,
          keyboardType:
              const TextInputType.numberWithOptions(
                decimal: true,
              ),
          decoration: _inputDecoration(
            hint: '0.00',
            prefixIcon: Icons.attach_money,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'supplier_offers.validation.price_required'
                  .tr();
            }

            final price = double.tryParse(value.trim());

            if (price == null) {
              return 'supplier_offers.validation.invalid_price'
                  .tr();
            }

            if (price < 0) {
              return 'supplier_offers.validation.negative_price'
                  .tr();
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildOfferStockField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.offer_stock'.tr()),
        const SizedBox(height: 8),
        TextFormField(
          controller: _stockController,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration(
            hint: 'common.optional'.tr(),
            prefixIcon: Icons.inventory_2_outlined,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return null;
            }

            final stock = int.tryParse(value.trim());

            if (stock == null) {
              return 'supplier_offers.validation.invalid_stock'
                  .tr();
            }

            if (stock < 0) {
              return 'supplier_offers.validation.negative_stock'
                  .tr();
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStatusField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('common.status'.tr()),
        const SizedBox(height: 8),
        CustomDropdown<String>(
          hint: 'supplier_offers.select_status'.tr(),
          value: _selectedStatus,
          items: [
            DropdownMenuItem<String>(
              value: 'available',
              child: Text(
                'supplier_offers.status.available'.tr(),
              ),
            ),
            DropdownMenuItem<String>(
              value: 'unavailable',
              child: Text(
                'supplier_offers.status.unavailable'.tr(),
              ),
            ),
          ],
          onChanged: (value) {
            if (value == null) {
              return;
            }

            setState(() {
              _selectedStatus = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSupplierProductField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(
          'supplier_offers.supplier_product_required'.tr(),
        ),
        const SizedBox(height: 8),
        BlocBuilder<
          SupplierProductsCubit,
          SupplierProductsState
        >(
          builder: (context, state) {
            if (state is SupplierProductsLoading) {
              return SizedBox(
                height: 56,
                child: Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                  ),
                ),
              );
            }

            if (state is SupplierProductsFailure) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    state.message,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: colors.error),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<SupplierProductsCubit>()
                          .getSupplierProducts();
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text('common.retry'.tr()),
                  ),
                ],
              );
            }

            if (state is SupplierProductsSuccess) {
              final supplierProducts =
                  state.supplierProducts;

              if (supplierProducts.isEmpty) {
                return Text(
                  'supplier_offers.no_supplier_products'
                      .tr(),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                );
              }

              return CustomDropdown<int>(
                hint: 'supplier_offers.select_supplier_product'
                    .tr(),
                value: _selectedSupplierProductId,
                items: supplierProducts.map((
                  supplierProduct,
                ) {
                  final productName =
                      supplierProduct.product?.name ??
                      'supplier_offers.product_fallback'.tr(
                        namedArgs: {
                          'id': supplierProduct.productId
                              .toString(),
                        },
                      );

                  final supplierName =
                      supplierProduct.supplier?.name ??
                      'supplier_offers.supplier_fallback'
                          .tr(
                            namedArgs: {
                              'id': supplierProduct
                                  .supplierId
                                  .toString(),
                            },
                          );

                  return DropdownMenuItem<int>(
                    value: supplierProduct.id,
                    child: Text(
                      '$productName — $supplierName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSupplierProductId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'supplier_offers.validation.select_supplier_product'
                        .tr();
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

  Widget _fieldLabel(String label) {
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

  InputDecoration _inputDecoration({
    required String hint,
    IconData? prefixIcon,
  }) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: colors.onSurfaceVariant,
            ),
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
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

  Future<void> _pickExpirationDate() async {
    final now = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );

    if (selectedDate == null || !mounted) {
      return;
    }

    setState(() {
      _expiresAtController.text =
          '${selectedDate.year.toString().padLeft(4, '0')}-'
          '${selectedDate.month.toString().padLeft(2, '0')}-'
          '${selectedDate.day.toString().padLeft(2, '0')}';
    });
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const [
        'jpg',
        'jpeg',
        'png',
        'webp',
      ],
      allowMultiple: false,
      withData: true,
    );

    if (result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.single;
    final bytes = file.bytes;
    final extension = file.extension?.toLowerCase();

    if (extension == null ||
        !_allowedImageExtensions.contains(extension)) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'supplier_offers.validation.invalid_image_format'
            .tr();
      });
      return;
    }

    if (file.size > _maxImageSize) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError =
            'supplier_offers.validation.image_too_large'
                .tr();
      });
      return;
    }

    if (bytes == null) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError =
            'supplier_offers.validation.image_read_failed'
                .tr();
      });
      return;
    }

    setState(() {
      _imageBytes = bytes;
      _imageFileName = file.name;
      _imageError = null;
    });
  }

  void _removeImage() {
    setState(() {
      _imageBytes = null;
      _imageFileName = null;
      _imageError = null;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedSupplierProductId == null) {
      return;
    }

    final offerPrice = double.tryParse(
      _priceController.text.trim(),
    );

    if (offerPrice == null) {
      return;
    }

    final stockText = _stockController.text.trim();

    final int? offerStock = stockText.isEmpty
        ? null
        : int.tryParse(stockText);

    final expiresAtText = _expiresAtController.text.trim();

    final MultipartFile? image =
        _imageBytes != null && _imageFileName != null
        ? MultipartFile.fromBytes(
            _imageBytes!,
            filename: _imageFileName!,
          )
        : null;

    context
        .read<CreateSupplierOfferCubit>()
        .createSupplierOffer(
          supplierProductId: _selectedSupplierProductId!,
          offerPrice: offerPrice,
          offerStock: offerStock,
          status: _selectedStatus,
          expiresAt: expiresAtText.isEmpty
              ? null
              : expiresAtText,
          image: image,
        );
  }
}
