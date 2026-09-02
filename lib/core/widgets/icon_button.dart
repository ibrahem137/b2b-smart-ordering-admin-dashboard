import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;

  final VoidCallback? onPressed;

  final String? tooltip;

  final AppIconButtonType type;

  final bool isLoading;

  final bool enabled;

  final double size;

  final Color? backgroundColor;

  final Color? foregroundColor;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.type = AppIconButtonType.standard,
    this.isLoading = false,
    this.enabled = true,
    this.size = 22,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final child = isLoading
        ? SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor,
            ),
          )
        : Icon(icon, size: size);

    Widget button;

    switch (type) {
      case AppIconButtonType.filled:
        button = IconButton.filled(
          onPressed: enabled && !isLoading ? onPressed : null,
          icon: child,
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor ?? scheme.primary,
            foregroundColor: foregroundColor ?? scheme.onPrimary,
          ),
        );
        break;

      case AppIconButtonType.tonal:
        button = IconButton.filledTonal(
          onPressed: enabled && !isLoading ? onPressed : null,
          icon: child,
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor ?? scheme.secondaryContainer,
            foregroundColor: foregroundColor ?? scheme.onSecondaryContainer,
          ),
        );
        break;

      case AppIconButtonType.outlined:
        button = IconButton.outlined(
          onPressed: enabled && !isLoading ? onPressed : null,
          icon: child,
          style: IconButton.styleFrom(
            foregroundColor: foregroundColor ?? scheme.primary,
          ),
        );
        break;

      case AppIconButtonType.standard:
        button = IconButton(
          onPressed: enabled && !isLoading ? onPressed : null,
          icon: child,
          color: foregroundColor,
        );
    }

    if (tooltip == null) return button;

    return Tooltip(message: tooltip!, child: button);
  }
}

/// ---------------------------------------------------------------------------
/// AppIconButton
/// ---------------------------------------------------------------------------
///
/// Reusable Material 3 icon button.
///
/// Features
/// --------
/// ✓ Material 3
/// ✓ Filled / Tonal / Outlined / Standard
/// ✓ Tooltip
/// ✓ Loading State
/// ✓ Disabled State
/// ✓ Custom Size
/// ✓ Custom Colors
///
/// ---------------------------------------------------------------------------

enum AppIconButtonType { standard, filled, tonal, outlined }
