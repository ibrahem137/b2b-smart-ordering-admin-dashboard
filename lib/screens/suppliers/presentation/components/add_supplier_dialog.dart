import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/create_supplier_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_supplier_categories_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AddSupplierDialog extends StatefulWidget {
  const AddSupplierDialog({super.key});

  @override
  State<AddSupplierDialog> createState() => _AddSupplierDialogState();
}

class _AddSupplierDialogState extends State<AddSupplierDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  late final PhoneController _phoneController;

  final Set<int> _selectedCategoryIds = {};

  bool _isActive = true;
  bool _showCategoryError = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocListener<UpdateSupplierCategoriesCubit, SupplierActionState>(
      listener: (context, state) {
        if (state is SupplierActionSuccess) {
          debugPrint('SUPPLIER CATEGORIES UPDATED SUCCESSFULLY');
          Navigator.pop(context, true);
        }

        if (state is SupplierActionFailure) {
          debugPrint('UPDATE SUPPLIER CATEGORIES FAILED: ${state.message}');

          _showErrorSnackBar(context, state.message);
        }
      },
      child: BlocConsumer<CreateSupplierCubit, SupplierActionState>(
        listener: (context, state) {
          if (state is SupplierActionSuccess) {
            debugPrint('SUPPLIER CREATED SUCCESSFULLY');

            debugPrint('CREATED SUPPLIER ID: ${state.supplierId}');

            final supplierId = state.supplierId;

            if (supplierId == null) {
              debugPrint('ERROR: SUPPLIER ID IS NULL');

              _showErrorSnackBar(
                context,
                'suppliers.errors.missing_supplier_id'.tr(),
              );

              return;
            }

            debugPrint('SYNCING CATEGORIES FOR SUPPLIER: $supplierId');

            debugPrint('CATEGORY IDS: $_selectedCategoryIds');

            context.read<UpdateSupplierCategoriesCubit>().updateCategories(
              supplierId: supplierId,
              categoryIds: _selectedCategoryIds.toList(),
            );
          }

          if (state is SupplierActionFailure) {
            debugPrint('CREATE SUPPLIER FAILED: ${state.message}');

            _showErrorSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state is SupplierActionLoading;

          return Dialog(
            backgroundColor: colors.surface,
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
                      _buildHeader(),

                      const SizedBox(height: 30),

                      _buildNameField(),

                      const SizedBox(height: 20),

                      _buildEmailField(),

                      const SizedBox(height: 20),

                      _buildPhoneField(),

                      const SizedBox(height: 28),

                      _buildCategories(),

                      if (_showCategoryError)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'suppliers.validation.category_required'.tr(),
                            style: TextStyle(
                              color: colors.error,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      _buildStatusSection(isLoading),

                      const SizedBox(height: 30),

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
    _emailController.dispose();
    _phoneController.dispose();
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
                    Navigator.pop(context);
                  },
            style: OutlinedButton.styleFrom(
              foregroundColor: colors.primary,
              side: BorderSide(color: colors.outline),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
            ),
            child: Text(
              'common.cancel'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FilledButton.icon(
            onPressed: isLoading ? null : _saveSupplier,
            style: FilledButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
            ),
            icon: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.onPrimary,
                    ),
                  )
                : const Icon(Icons.add),
            label: Text(
              isLoading
                  ? 'suppliers.actions.adding'.tr()
                  : 'suppliers.actions.add'.tr(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'navigation.categories'.tr(),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is CategoriesFailure) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.message,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.error,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextButton.icon(
                    onPressed: () {
                      context.read<CategoriesCubit>().getCategories();
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text('common.retry'.tr()),
                  ),
                ],
              );
            }

            if (state is CategoriesSuccess) {
              final categories = state.categories;

              if (categories.isEmpty) {
                return Text(
                  'suppliers.categories.empty'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                );
              }

              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  final selected = _selectedCategoryIds.contains(category.id);

                  return FilterChip(
                    label: Text(category.name),
                    selected: selected,
                    showCheckmark: false,
                    selectedColor: colors.primary.withValues(alpha: .12),
                    backgroundColor: colors.surfaceContainerHighest,
                    side: BorderSide(
                      color: selected ? colors.primary : colors.outlineVariant,
                    ),
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: selected ? colors.primary : colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          _selectedCategoryIds.add(category.id);
                        } else {
                          _selectedCategoryIds.remove(category.id);
                        }

                        _showCategoryError = false;
                      });
                    },
                  );
                }).toList(),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: _inputDecoration(
        label: 'common.email'.tr(),
        icon: Icons.email_outlined,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'suppliers.validation.email_required'.tr();
        }

        if (!EmailValidator.validate(value.trim())) {
          return 'suppliers.validation.invalid_email'.tr();
        }

        return null;
      },
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.people_alt_outlined,
            color: colors.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'suppliers.add_dialog.title'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'suppliers.add_dialog.subtitle'.tr(),
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

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: _inputDecoration(
        label: 'suppliers.fields.name'.tr(),
        icon: Icons.person_outline,
      ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'suppliers.validation.name_required'.tr();
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
          hintText: 'suppliers.fields.search_country'.tr(),
          filled: true,
          fillColor: colors.surfaceContainerHighest,
        ),
        backgroundColor: colors.surface,
        height: 440,
        width: 330,
      ),
      validator: PhoneValidator.validMobile(
        context,
        errorText: 'suppliers.validation.invalid_phone'.tr(),
      ),
      decoration: _inputDecoration(
        label: 'suppliers.fields.phone'.tr(),
        icon: Icons.phone_outlined,
      ),
    );
  }

  Widget _buildStatusSection(bool isLoading) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'suppliers.status.active_title'.tr(),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isActive
                      ? 'suppliers.status.active_description'.tr()
                      : 'suppliers.status.inactive_description'.tr(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isActive,
            onChanged: isLoading
                ? null
                : (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(labelText: label, prefixIcon: Icon(icon));
  }

  void _saveSupplier() {
    debugPrint('ADD SUPPLIER CLICKED');

    final isValid = _formKey.currentState!.validate();

    setState(() {
      _showCategoryError = _selectedCategoryIds.isEmpty;
    });

    debugPrint('FORM VALID: $isValid');

    debugPrint('SELECTED CATEGORY IDS: $_selectedCategoryIds');

    if (!isValid || _showCategoryError) {
      debugPrint('VALIDATION FAILED');
      return;
    }

    final phone = _phoneController.value;

    debugPrint('CALLING CREATE SUPPLIER');

    debugPrint('NAME: ${_nameController.text}');

    debugPrint('EMAIL: ${_emailController.text}');

    debugPrint('PHONE: ${phone.international}');

    debugPrint('CATEGORY IDS: $_selectedCategoryIds');

    debugPrint('STATUS: ${_isActive ? 'active' : 'inactive'}');

    context.read<CreateSupplierCubit>().createSupplier(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: phone.international,
      address: null,
      isActive: _isActive,
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
