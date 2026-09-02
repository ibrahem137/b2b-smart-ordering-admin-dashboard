import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PageHeader
/// ---------------------------------------------------------------------------
///
/// Standard header used at the top of every dashboard page.
///
/// Example
/// -------
///
/// PageHeader(
///   title: 'Suppliers',
///   subtitle: 'Manage all registered suppliers',
///   action: FilledButton(
///     onPressed: () {},
///     child: Text('Add Supplier'),
///   ),
/// )
///
/// ---------------------------------------------------------------------------

class PageHeader extends StatelessWidget {
  final String title;

  final String? subtitle;

  /// Main action (usually Add button)
  final Widget? action;

  /// Optional multiple actions
  final List<Widget> actions;

  final EdgeInsetsGeometry padding;

  final bool showDivider;

  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
    this.actions = const [],
    this.padding = const EdgeInsets.only(bottom: 24),
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _HeaderTexts(title: title, subtitle: subtitle),
              ),

              if (actions.isNotEmpty) ...[
                Wrap(spacing: 12, runSpacing: 12, children: actions),
              ],

              if (action != null) ...[
                if (actions.isNotEmpty) const SizedBox(width: 12),

                action!,
              ],
            ],
          ),

          if (showDivider) ...[
            const SizedBox(height: 20),
            Divider(color: theme.colorScheme.outlineVariant, height: 1),
          ],
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Header Texts
/// ---------------------------------------------------------------------------

class _HeaderTexts extends StatelessWidget {
  final String title;

  final String? subtitle;
  const _HeaderTexts({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        if (subtitle != null) ...[
          const SizedBox(height: 6),

          Text(subtitle!, style: textTheme.bodyMedium),
        ],
      ],
    );
  }
}
