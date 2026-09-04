import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/categories/presentation/components/color_picker.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';
import 'package:dashboard/screens/categories/presentation/cubit/update_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
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

  late Color _selectedColor;

  final List<Color> _availableColors = const [
    Color(0xFF1E40AF),
    Color(0xFF3B82F6),
    Color(0xFF16A34A),
    Color(0xFFF59E0B),
    Color(0xFFDC2626),
    Color(0xFF7C3AED),
    Color(0xFFDB2777),
    Color(0xFF0891B2),
    Color(0xFF65A30D),
    Color(0xFFEA580C),
    Color(0xFF475569),
    Color(0xFF0F766E),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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

    _selectedColor = _parseColor(
      widget.category.color,
      fallback: const Color(0xFF3B82F6),
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
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'common.cancel'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
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
                : Text('categories.save_changes'.tr()),
          ),
        ),
      ],
    );
  }

  Widget _buildColorSection(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'categories.category_color'.tr(),
          style: theme.textTheme.titleSmall?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'categories.choose_category_color'.tr(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),

        const SizedBox(height: 18),

        ColorPicker(
          colors: _availableColors,
          selectedColor: _selectedColor,
          onColorSelected: (color) {
            setState(() {
              _selectedColor = color;
            });
          },
        ),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.outlineVariant),
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.category_outlined,
                  color: _foregroundColor(_selectedColor),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'categories.color_preview'.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      _colorToHex(_selectedColor),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                'categories.edit_category'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'categories.edit_category_subtitle'.tr(
                  namedArgs: {'name': widget.category.name},
                ),
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
      decoration: InputDecoration(
        labelText: 'categories.category_name'.tr(),
        prefixIcon: const Icon(Icons.category_outlined),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'categories.category_name_required'.tr();
        }

        return null;
      },
    );
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }

  Color _foregroundColor(Color background) {
    return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
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

    final colorHex = _colorToHex(_selectedColor);

    debugPrint('========== UPDATE CATEGORY ==========');
    debugPrint('ID: ${widget.category.id}');
    debugPrint('NAME: ${_nameController.text.trim()}');
    debugPrint('COLOR: $colorHex');

    await context.read<UpdateCategoryCubit>().updateCategory(
      id: widget.category.id,
      name: _nameController.text.trim(),
      color: colorHex,
    );
  }
}
