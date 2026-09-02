import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';
import 'package:dashboard/screens/categories/presentation/cubit/update_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCategoryDialog extends StatefulWidget {
  final CategoryModel category;

  const EditCategoryDialog({super.key, required this.category});

  @override
  State<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;

  late String _selectedColor;

  final List<String> _availableColors = const [
    '#1E40AF',
    '#3B82F6',
    '#16A34A',
    '#F59E0B',
    '#DC2626',
    '#7C3AED',
    '#DB2777',
    '#0891B2',
    '#65A30D',
    '#EA580C',
    '#475569',
    '#0F766E',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<UpdateCategoryCubit, CategoryActionState>(
      listener: (context, state) {
        if (state is CategoryActionSuccess) {
          Navigator.pop(context, true);
        }

        if (state is CategoryActionFailure) {
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
        final isLoading = state is CategoryActionLoading;

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
                    _buildHeader(context),

                    const SizedBox(height: 28),

                    _buildNameField(),

                    const SizedBox(height: 26),

                    _buildColorSection(context),

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
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.category.name);

    _selectedColor = _normalizeColor(widget.category.color);
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
          child: FilledButton(
            onPressed: isLoading ? null : _updateCategory,
            style: FilledButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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

  Widget _buildColorSection(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final selectedColor = _parseColor(_selectedColor, fallback: colors.primary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category Color',
          style: theme.textTheme.titleSmall?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'Choose a color to represent this category.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),

        const SizedBox(height: 18),

        // Current selected color preview
        Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Icon(
              Icons.category_outlined,
              size: 42,
              color: _foregroundColor(selectedColor),
            ),
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: selectedColor,
                shape: BoxShape.circle,
                border: Border.all(color: colors.outlineVariant),
              ),
            ),

            const SizedBox(width: 8),

            Text(
              _selectedColor.toUpperCase(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _availableColors.map((colorHex) {
            final color = _parseColor(colorHex, fallback: colors.primary);

            final isSelected =
                colorHex.toUpperCase() == _selectedColor.toUpperCase();

            return InkWell(
              onTap: () {
                setState(() {
                  _selectedColor = colorHex;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? colors.onSurface
                        : colors.outlineVariant,
                    width: isSelected ? 3 : 1,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: _foregroundColor(color),
                        size: 22,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                'Edit Category',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Update ${widget.category.name}.',
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
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'Category Name',
        prefixIcon: Icon(Icons.category_outlined),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Category name is required';
        }

        return null;
      },
    );
  }

  Color _foregroundColor(Color background) {
    return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  String _normalizeColor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '#3B82F6';
    }

    var color = value.trim().toUpperCase();

    if (!color.startsWith('#')) {
      color = '#$color';
    }

    return color;
  }

  Color _parseColor(String? value, {required Color fallback}) {
    if (value == null || value.trim().isEmpty) {
      return fallback;
    }

    var hex = value.trim().replaceAll('#', '');

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    final parsed = int.tryParse(hex, radix: 16);

    if (parsed == null) {
      return fallback;
    }

    return Color(parsed);
  }

  Future<void> _updateCategory() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<UpdateCategoryCubit>().updateCategory(
      id: widget.category.id,
      name: _nameController.text.trim(),
      color: _selectedColor,
    );
  }
}
