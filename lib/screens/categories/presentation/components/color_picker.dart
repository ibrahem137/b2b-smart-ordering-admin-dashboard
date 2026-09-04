import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorPicker({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: colors.map((color) {
        final isSelected = color.toARGB32() == selectedColor.toARGB32();

        return Tooltip(
          message: isSelected
              ? 'categories.selected_color'.tr()
              : 'categories.select_color'.tr(),
          child: InkWell(
            onTap: () {
              onColorSelected(color);
            },
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? colorScheme.onSurface
                      : colorScheme.outlineVariant,
                  width: isSelected ? 3 : 1,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 22,
                      color: _foregroundColor(color, colorScheme),
                    )
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _foregroundColor(Color background, ColorScheme colorScheme) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
        ? colorScheme.surface
        : colorScheme.onSurface;
  }
}
