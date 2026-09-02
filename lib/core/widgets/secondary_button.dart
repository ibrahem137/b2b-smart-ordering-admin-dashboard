import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SecondaryButton
/// ---------------------------------------------------------------------------
///
/// Standard secondary action button.
///
/// Features
/// --------
/// ✓ Material 3 OutlinedButton
/// ✓ Loading state
/// ✓ Icon support
/// ✓ Full width
/// ✓ Custom colors
/// ✓ Disabled state
/// ✓ Consistent sizing
///
/// Example
/// -------
///
/// SecondaryButton(
///   text: 'Cancel',
///   onPressed: () {},
/// )
///
/// ---------------------------------------------------------------------------

class SecondaryButton extends StatelessWidget {
  final String text;

  final IconData? icon;

  final VoidCallback? onPressed;

  final bool isLoading;

  final bool enabled;

  final bool fullWidth;

  final double? width;

  final double height;

  final double borderRadius;

  final Color? borderColor;

  final Color? foregroundColor;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    this.fullWidth = false,
    this.width,
    this.height = 48,
    this.borderRadius = 12,
    this.borderColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final color = foregroundColor ?? scheme.primary;

    final button = OutlinedButton(
      onPressed: enabled && !isLoading ? onPressed : null,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(fullWidth ? double.infinity : (width ?? 120), height),
        foregroundColor: color,
        side: BorderSide(color: borderColor ?? scheme.outline),
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
                  color: color,
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
