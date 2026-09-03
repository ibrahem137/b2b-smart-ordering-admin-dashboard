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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: colors.map((color) {
        final isSelected = color == selectedColor;

        return Tooltip(
          message: isSelected
              ? 'categories.selected_color'.tr()
              : 'categories.select_color'.tr(),
          child: InkWell(
            onTap: () => onColorSelected(color),
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                  width: isSelected ? 3 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: .30),
                    blurRadius: isSelected ? 10 : 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                scale: isSelected ? 1 : 0,
                child: Icon(
                  Icons.check,
                  color: _foregroundColorFor(
                    color,
                    colorScheme,
                  ),
                  size: 22,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _foregroundColorFor(
    Color background,
    ColorScheme colorScheme,
  ) {
    final brightness = ThemeData.estimateBrightnessForColor(
      background,
    );

    return brightness == Brightness.dark
        ? colorScheme.surface
        : colorScheme.onSurface;
  }
}
