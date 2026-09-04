import 'dart:typed_data';

import 'package:dashboard/screens/stores/presentation/cubit/create_store_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_action_state.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AddStoreDialog extends StatefulWidget {
  const AddStoreDialog({super.key});

  @override
  State<AddStoreDialog> createState() => _AddStoreDialogState();
}

class _AddStoreDialogState extends State<AddStoreDialog> {
  static const int _maxImageSize = 5 * 1024 * 1024;

  static const Set<String> _allowedImageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'webp',
  };

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ownerController = TextEditingController();
  late final PhoneController _phoneController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  String _selectedStatus = 'active';

  Uint8List? _imageBytes;
  String? _imageFileName;
  String? _imageError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<CreateStoreCubit, StoreActionState>(
      listener: (context, state) {
        switch (state) {
          case StoreActionSuccess():
            Navigator.of(context).pop(true);

          case StoreActionFailure(:final message):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colors.error,
                content: Text(message, style: TextStyle(color: colors.onError)),
              ),
            );

          default:
            break;
        }
      },
      builder: (context, state) {
        final isLoading = state is StoreActionLoading;

        return Dialog(
          backgroundColor: colors.surface,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: colors.outlineVariant),
          ),
          child: SizedBox(
            width: 700,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 28),

                    Row(
                      children: [
                        Expanded(child: _buildNameField()),
                        const SizedBox(width: 16),
                        Expanded(child: _buildOwnerField()),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildPhoneField()),
                        const SizedBox(width: 16),
                        Expanded(child: _buildEmailField()),
                      ],
                    ),

                    const SizedBox(height: 18),

                    _buildPasswordField(context),

                    const SizedBox(height: 18),

                    _buildTextField(
                      controller: _addressController,
                      label: 'stores.fields.address'.tr(),
                      icon: Icons.location_on_outlined,
                      requiredField: false,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 22),

                    _buildStatusField(),

                    const SizedBox(height: 22),

                    _buildImageField(),

                    const SizedBox(height: 28),

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
    _ownerController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _phoneController = PhoneController(
      initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ''),
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
                    Navigator.of(context).pop(false);
                  },
            child: Text('common.cancel'.tr()),
          ),
        ),
        const SizedBox(width: 12),
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
                : Text('stores.add_store'.tr()),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'stores.fields.email'.tr(),
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'stores.validation.email_required'.tr();
        }

        if (!EmailValidator.validate(value.trim())) {
          return 'stores.validation.invalid_email'.tr();
        }

        return null;
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
          backgroundColor: colors.primary,
          child: Icon(Icons.storefront_outlined, color: colors.onPrimary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'stores.add_store'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'stores.add_store_subtitle'.tr(),
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
        Text(
          'stores.fields.image'.tr(),
          style: theme.textTheme.titleSmall?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickImage,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _imageError == null
                    ? colors.outlineVariant
                    : colors.error,
              ),
            ),
            child: _imageBytes == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 40,
                        color: colors.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'stores.choose_image'.tr(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                  ),
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

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'stores.fields.name'.tr(),
        prefixIcon: const Icon(Icons.store_outlined),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'stores.validation.name_required'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildOwnerField() {
    return TextFormField(
      controller: _ownerController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'stores.fields.owner_name'.tr(),
        prefixIcon: const Icon(Icons.person_outline),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'stores.validation.owner_required'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'stores.fields.password'.tr(),
        prefixIcon: const Icon(Icons.lock_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'stores.validation.password_required'.tr();
        }

        if (value.length < 8) {
          return 'stores.validation.password_min'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildPhoneField() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return PhoneFormField(
      controller: _phoneController,
      countrySelectorNavigator: CountrySelectorNavigator.dialog(
        searchBoxTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface,
        ),
        searchBoxDecoration: InputDecoration(
          hintText: 'stores.fields.search_country'.tr(),
          filled: true,
          fillColor: colors.surfaceContainerHighest,
        ),
        backgroundColor: colors.surface,
        height: 440,
        width: 330,
      ),
      validator: PhoneValidator.validMobile(
        context,
        errorText: 'stores.validation.invalid_phone'.tr(),
      ),
      decoration: InputDecoration(
        labelText: 'stores.fields.phone'.tr(),
        prefixIcon: const Icon(Icons.phone_outlined),
      ),
    );
  }

  Widget _buildStatusField() {
    return DropdownButtonFormField<String>(
      initialValue: _selectedStatus,
      decoration: InputDecoration(
        labelText: 'common.status'.tr(),
        prefixIcon: const Icon(Icons.toggle_on_outlined),
      ),
      items: [
        DropdownMenuItem(
          value: 'active',
          child: Text('stores.status.active'.tr()),
        ),
        DropdownMenuItem(
          value: 'inactive',
          child: Text('stores.status.inactive'.tr()),
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
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool requiredField = true,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      validator: (value) {
        if (!requiredField) {
          return null;
        }

        if (value == null || value.trim().isEmpty) {
          return 'stores.validation.required'.tr();
        }

        return null;
      },
    );
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
    final extension = file.extension?.toLowerCase();

    if (extension == null || !_allowedImageExtensions.contains(extension)) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'stores.validation.invalid_image'.tr();
      });

      return;
    }

    if (file.size > _maxImageSize) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'stores.validation.image_too_large'.tr();
      });

      return;
    }

    if (file.bytes == null) {
      setState(() {
        _imageBytes = null;
        _imageFileName = null;
        _imageError = 'stores.validation.image_read_failed'.tr();
      });

      return;
    }

    setState(() {
      _imageBytes = file.bytes;
      _imageFileName = file.name;
      _imageError = null;
    });
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    MultipartFile? image;

    if (_imageBytes != null && _imageFileName != null) {
      image = MultipartFile.fromBytes(_imageBytes!, filename: _imageFileName!);
    }

    final phone = _phoneController.value;

    await context.read<CreateStoreCubit>().createStore(
      name: _nameController.text.trim(),
      ownerName: _ownerController.text.trim(),
      phone: phone.international,
      email: _emailController.text.trim(),
      password: _passwordController.text,
      address: _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim(),
      status: _selectedStatus,
      image: image,
    );
  }
}
