import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PrimaryButton
/// ---------------------------------------------------------------------------
///
/// Standard primary action button used across the dashboard.
///
/// Features
/// --------
/// ✓ Material 3 FilledButton
/// ✓ Loading state
/// ✓ Icon support
/// ✓ Full width option
/// ✓ Custom colors
/// ✓ Disabled state
/// ✓ Consistent sizing
///
/// Example
/// -------
///
/// PrimaryButton(
///   text: 'Save',
///   icon: Icons.save,
///   onPressed: () {},
/// )
///
/// ---------------------------------------------------------------------------

class PrimaryButton extends StatelessWidget {
  final String text;

  final IconData? icon;

  final VoidCallback? onPressed;

  final bool isLoading;

  final bool enabled;

  final bool fullWidth;

  final double? width;

  final double height;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    this.fullWidth = false,
    this.width,
    this.height = 48,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final button = FilledButton(
      onPressed: enabled && !isLoading ? onPressed : null,
      style: FilledButton.styleFrom(
        minimumSize: Size(fullWidth ? double.infinity : (width ?? 120), height),
        backgroundColor: backgroundColor ?? scheme.primary,
        foregroundColor: foregroundColor ?? scheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isLoading
            ? SizedBox(
                key: const ValueKey('loading'),
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: foregroundColor ?? scheme.onPrimary,
                ),
              )
            : Row(
                key: const ValueKey('content'),
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18),
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, height: height, child: button);
    }

    return SizedBox(width: width, height: height, child: button);
  }
}
