import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_state.dart';
import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_action_state.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_suppliers_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSupplierDialog extends StatefulWidget {
  final SupplierModel supplier;

  const EditSupplierDialog({super.key, required this.supplier});

  @override
  State<EditSupplierDialog> createState() => _EditSupplierDialogState();
}

class _EditSupplierDialogState extends State<EditSupplierDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  final Set<int> _selectedCategoryIds = {};

  late bool _isActive;

  bool _showCategoryError = false;
  bool _supplierCategoriesLoaded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<SupplierCategoriesCubit, SupplierCategoriesState>(
          listener: (context, state) {
            if (state is SupplierCategoriesSuccess) {
              if (!_supplierCategoriesLoaded) {
                setState(() {
                  _selectedCategoryIds
                    ..clear()
                    ..addAll(state.categoryIds);

                  _supplierCategoriesLoaded = true;
                });

                debugPrint(
                  'CURRENT SUPPLIER CATEGORY IDS: '
                  '$_selectedCategoryIds',
                );
              }
            }

            if (state is SupplierCategoriesFailure) {
              _showErrorSnackBar(context, state.message);
            }
          },
        ),

        BlocListener<UpdateSupplierCubit, SupplierActionState>(
          listener: (context, state) {
            if (state is SupplierActionSuccess) {
              debugPrint('SUPPLIER INFO UPDATED SUCCESSFULLY');

              debugPrint(
                'SYNCING EDITED CATEGORIES: '
                '$_selectedCategoryIds',
              );

              context.read<UpdateSupplierCategoriesCubit>().updateCategories(
                supplierId: widget.supplier.id,
                categoryIds: _selectedCategoryIds.toList(),
              );
            }

            if (state is SupplierActionFailure) {
              debugPrint(
                'UPDATE SUPPLIER FAILED: '
                '${state.message}',
              );

              _showErrorSnackBar(context, state.message);
            }
          },
        ),

        BlocListener<UpdateSupplierCategoriesCubit, SupplierActionState>(
          listener: (context, state) {
            if (state is SupplierActionSuccess) {
              debugPrint('SUPPLIER CATEGORIES UPDATED SUCCESSFULLY');

              Navigator.pop(context, true);
            }

            if (state is SupplierActionFailure) {
              debugPrint(
                'UPDATE SUPPLIER CATEGORIES FAILED: '
                '${state.message}',
              );

              _showErrorSnackBar(context, state.message);
            }
          },
        ),
      ],
      child: BlocBuilder<UpdateSupplierCubit, SupplierActionState>(
        builder: (context, updateState) {
          return BlocBuilder<
            UpdateSupplierCategoriesCubit,
            SupplierActionState
          >(
            builder: (context, categoriesUpdateState) {
              final isUpdating =
                  updateState is SupplierActionLoading ||
                  categoriesUpdateState is SupplierActionLoading;

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

                          const SizedBox(height: 20),

                          _buildAddressField(),

                          const SizedBox(height: 28),

                          _buildCategories(),

                          if (_showCategoryError)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Please select at least one category.',
                                style: TextStyle(
                                  color: colors.error,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                          const SizedBox(height: 24),

                          _buildStatusSection(isUpdating),

                          const SizedBox(height: 30),

                          _buildActions(context, isUpdating),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
    _addressController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.supplier.name);

    _emailController = TextEditingController(text: widget.supplier.email ?? '');

    _phoneController = TextEditingController(text: widget.supplier.phone ?? '');

    _addressController = TextEditingController(
      text: widget.supplier.address ?? '',
    );

    _isActive = widget.supplier.isActive;
  }

  Widget _buildActions(BuildContext context, bool isUpdating) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: isUpdating
                ? null
                : () {
                    Navigator.pop(context);
                  },
            style: OutlinedButton.styleFrom(
              foregroundColor: colors.primary,
              side: BorderSide(color: colors.outline),
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: FilledButton.icon(
            onPressed: isUpdating ? null : _updateSupplier,
            style: FilledButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: isUpdating
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.onPrimary,
                    ),
                  )
                : const Icon(Icons.save_outlined),
            label: Text(isUpdating ? 'Saving...' : 'Save Changes'),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: _addressController,
      textInputAction: TextInputAction.done,
      decoration: _inputDecoration(
        label: 'Address',
        icon: Icons.location_on_outlined,
      ),
    );
  }

  Widget _buildCategories() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        BlocBuilder<SupplierCategoriesCubit, SupplierCategoriesState>(
          builder: (context, supplierCategoriesState) {
            if (supplierCategoriesState is SupplierCategoriesLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (supplierCategoriesState is SupplierCategoriesFailure) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    supplierCategoriesState.message,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.error,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<SupplierCategoriesCubit>()
                          .getSupplierCategories(widget.supplier.id);
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              );
            }

            return BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, categoriesState) {
                if (categoriesState is CategoriesLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (categoriesState is CategoriesFailure) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoriesState.message,
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
                        label: const Text('Retry'),
                      ),
                    ],
                  );
                }

                if (categoriesState is CategoriesSuccess) {
                  if (categoriesState.categories.isEmpty) {
                    return Text(
                      'No categories available.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    );
                  }

                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: categoriesState.categories.map((category) {
                      final selected = _selectedCategoryIds.contains(
                        category.id,
                      );

                      return FilterChip(
                        label: Text(category.name),
                        selected: selected,
                        showCheckmark: false,
                        selectedColor: colors.primary.withValues(alpha: .12),
                        backgroundColor: colors.surfaceContainerHighest,
                        side: BorderSide(
                          color: selected
                              ? colors.primary
                              : colors.outlineVariant,
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
            );
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
      decoration: _inputDecoration(label: 'Email', icon: Icons.email_outlined),
      validator: (value) {
        final email = value?.trim() ?? '';

        if (email.isEmpty) {
          return null;
        }

        if (!EmailValidator.validate(email)) {
          return 'Please enter a valid email address';
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
          child: Icon(Icons.edit_outlined, color: colors.primary, size: 24),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Supplier',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Update ${widget.supplier.name}.',
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
      textInputAction: TextInputAction.next,
      decoration: _inputDecoration(
        label: 'Supplier Name',
        icon: Icons.person_outline,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Supplier name is required';
        }

        return null;
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: _inputDecoration(
        label: 'Phone Number',
        icon: Icons.phone_outlined,
      ),
    );
  }

  Widget _buildStatusSection(bool isUpdating) {
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
                  'Supplier Active',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isActive
                      ? 'Supplier can receive orders'
                      : 'Supplier is disabled',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: _isActive,
            onChanged: isUpdating
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

  String? _emptyToNull(String value) {
    final trimmed = value.trim();

    return trimmed.isEmpty ? null : trimmed;
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(labelText: label, prefixIcon: Icon(icon));
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

  void _updateSupplier() {
    final valid = _formKey.currentState!.validate();

    setState(() {
      _showCategoryError = _selectedCategoryIds.isEmpty;
    });

    if (!valid || _showCategoryError) {
      return;
    }

    debugPrint('========== EDIT SUPPLIER ==========');

    debugPrint(
      'SUPPLIER ID: '
      '${widget.supplier.id}',
    );

    debugPrint(
      'NAME: '
      '${_nameController.text}',
    );

    debugPrint(
      'CATEGORY IDS: '
      '$_selectedCategoryIds',
    );

    context.read<UpdateSupplierCubit>().updateSupplier(
      id: widget.supplier.id,
      name: _nameController.text.trim(),
      email: _emptyToNull(_emailController.text),
      phone: _emptyToNull(_phoneController.text),
      address: _emptyToNull(_addressController.text),
      isActive: _isActive,
    );
  }
}
