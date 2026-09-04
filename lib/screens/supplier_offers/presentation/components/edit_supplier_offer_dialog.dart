import 'dart:typed_data';

import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/update_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/custom_dropdown.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_state.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSupplierOfferDialog extends StatefulWidget {
  final SupplierOfferModel offer;

  const EditSupplierOfferDialog({super.key, required this.offer});

  @override
  State<EditSupplierOfferDialog> createState() =>
      _EditSupplierOfferDialogState();
}

class _EditSupplierOfferDialogState extends State<EditSupplierOfferDialog> {
  static const int _maxImageSize = 5 * 1024 * 1024;

  static const Set<String> _allowedImageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'webp',
  };

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _priceController;
  late final TextEditingController _stockController;
  late final TextEditingController _expiresAtController;

  late int _selectedSupplierProductId;
  late String _selectedStatus;

  Uint8List? _imageBytes;
  String? _imageFileName;
  String? _imageError;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<UpdateSupplierOfferCubit, SupplierOfferActionState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            Navigator.of(context).pop(true);
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colors.error,
                content: Text(message, style: TextStyle(color: colors.onError)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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

  @override
  void initState() {
    super.initState();

    _selectedSupplierProductId = widget.offer.supplierProductId;
    _selectedStatus = widget.offer.status;

    _priceController = TextEditingController(text: widget.offer.offerPrice);

    _stockController = TextEditingController(
      text: widget.offer.offerStock?.toString() ?? '',
    );

    _expiresAtController = TextEditingController(
      text: _formatInitialDate(widget.offer.expiresAt),
    );
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
            child: Text(
              'common.cancel'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                    'common.save_changes'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
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
        _fieldLabel('supplier_offers.fields.expires_at'.tr()),
        const SizedBox(height: 8),
        TextFormField(
          controller: _expiresAtController,
          readOnly: true,
          decoration:
              _inputDecoration(
                hint: 'common.optional'.tr(),
                prefixIcon: Icons.event_outlined,
              ).copyWith(
                suffixIcon: _expiresAtController.text.isNotEmpty
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
          child: Icon(Icons.edit_outlined, color: colors.onPrimary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'supplier_offers.edit_title'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'supplier_offers.edit_subtitle'.tr(),
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
    final existingImageUrl = widget.offer.imageUrl?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.fields.offer_image'.tr()),
        const SizedBox(height: 4),
        Text(
          _imageBytes == null && existingImageUrl.isNotEmpty
              ? 'supplier_offers.current_image_kept'.tr()
              : 'supplier_offers.image_optional_hint'.tr(),
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
            child: _imageBytes != null
                ? _buildSelectedImagePreview()
                : existingImageUrl.isNotEmpty
                ? _buildNetworkImagePreview(existingImageUrl)
                : _buildImageUploadState(),
          ),
        ),
        if (_imageError != null) ...[
          const SizedBox(height: 6),
          Text(
            _imageError!,
            style: theme.textTheme.bodySmall?.copyWith(color: colors.error),
          ),
        ],
      ],
    );
  }

  Widget _buildImageUploadState() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.cloud_upload_outlined, size: 42, color: colors.primary),
        const SizedBox(height: 10),
        Text(
          'supplier_offers.choose_replacement_image'.tr(),
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

  Widget _buildNetworkImagePreview(String imageUrl) {
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 42,
                    color: colors.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.outlineVariant),
            ),
            child: Text(
              'supplier_offers.current_image'.tr(),
              style: TextStyle(color: colors.onSurface, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOfferPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.fields.offer_price'.tr()),
        const SizedBox(height: 8),
        TextFormField(
          controller: _priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: _inputDecoration(
            hint: '0.00',
            prefixIcon: Icons.attach_money,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'supplier_offers.validation.offer_price_required'.tr();
            }

            final price = double.tryParse(value.trim());

            if (price == null) {
              return 'supplier_offers.validation.invalid_offer_price'.tr();
            }

            if (price < 0) {
              return 'supplier_offers.validation.negative_offer_price'.tr();
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
        _fieldLabel('supplier_offers.fields.offer_stock'.tr()),
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
              return 'supplier_offers.validation.invalid_offer_stock'.tr();
            }

            if (stock < 0) {
              return 'supplier_offers.validation.negative_offer_stock'.tr();
            }

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSelectedImagePreview() {
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
            tooltip: 'supplier_offers.remove_replacement_image'.tr(),
            onPressed: _removeSelectedImage,
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

  Widget _buildStatusField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('supplier_offers.fields.status'.tr()),
        const SizedBox(height: 8),
        CustomDropdown<String>(
          hint: 'supplier_offers.select_status'.tr(),
          value: _selectedStatus,
          items: [
            DropdownMenuItem<String>(
              value: 'available',
              child: Text('supplier_offers.status.available'.tr()),
            ),
            DropdownMenuItem<String>(
              value: 'unavailable',
              child: Text('supplier_offers.status.unavailable'.tr()),
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
        _fieldLabel('supplier_offers.fields.supplier_product'.tr()),
        const SizedBox(height: 8),
        BlocBuilder<SupplierProductsCubit, SupplierProductsState>(
          builder: (context, state) {
            if (state is SupplierProductsLoading) {
              return SizedBox(
                height: 56,
                child: Center(
                  child: CircularProgressIndicator(color: colors.primary),
                ),
              );
            }

            if (state is SupplierProductsFailure) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.error,
                    ),
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
              final supplierProducts = state.supplierProducts;

              if (supplierProducts.isEmpty) {
                return Text(
                  'supplier_offers.no_supplier_products'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                );
              }

              final currentExists = supplierProducts.any(
                (item) => item.id == _selectedSupplierProductId,
              );

              final dropdownValue = currentExists
                  ? _selectedSupplierProductId
                  : null;

              return CustomDropdown<int>(
                hint: 'supplier_offers.select_supplier_product'.tr(),
                value: dropdownValue,
                items: supplierProducts.map((supplierProduct) {
                  final productName =
                      supplierProduct.product?.name ??
                      'supplier_offers.product_fallback'.tr(
                        namedArgs: {'id': supplierProduct.productId.toString()},
                      );

                  final supplierName =
                      supplierProduct.supplier?.name ??
                      'supplier_offers.supplier_fallback'.tr(
                        namedArgs: {
                          'id': supplierProduct.supplierId.toString(),
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
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedSupplierProductId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'supplier_offers.validation.supplier_product_required'
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

  String _formatInitialDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '';
    }

    final date = DateTime.tryParse(value);

    if (date == null) {
      return value;
    }

    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
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
          : Icon(prefixIcon, color: colors.onSurfaceVariant),
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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

  Future<void> _pickExpirationDate() async {
    final now = DateTime.now();

    final currentDate = DateTime.tryParse(_expiresAtController.text);

    final initialDate =
        currentDate != null &&
            !currentDate.isBefore(DateTime(now.year, now.month, now.day))
        ? currentDate
        : now;

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year, now.month, now.day),
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
        _imageError = 'supplier_offers.validation.invalid_image_type'.tr();
      });

      return;
    }

    if (file.size > _maxImageSize) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'supplier_offers.validation.image_too_large'.tr();
      });

      return;
    }

    if (bytes == null) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'supplier_offers.validation.image_read_failed'.tr();
      });

      return;
    }

    setState(() {
      _imageBytes = bytes;
      _imageFileName = file.name;
      _imageError = null;
    });
  }

  void _removeSelectedImage() {
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

    final offerPrice = double.tryParse(_priceController.text.trim());

    if (offerPrice == null) {
      return;
    }

    final stockText = _stockController.text.trim();

    final int? offerStock = stockText.isEmpty ? null : int.tryParse(stockText);

    final expiresAtText = _expiresAtController.text.trim();

    final MultipartFile? image = _imageBytes != null && _imageFileName != null
        ? MultipartFile.fromBytes(_imageBytes!, filename: _imageFileName!)
        : null;

    context.read<UpdateSupplierOfferCubit>().updateSupplierOffer(
      id: widget.offer.id,
      supplierProductId: _selectedSupplierProductId,
      offerPrice: offerPrice,
      offerStock: offerStock,
      status: _selectedStatus,
      expiresAt: expiresAtText.isEmpty ? null : expiresAtText,
      image: image,
    );
  }
}
