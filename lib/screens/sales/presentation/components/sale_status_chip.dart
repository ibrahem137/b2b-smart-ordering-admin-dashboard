import 'package:dashboard/core/theme/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SaleStatusChip extends StatelessWidget {
  final String status;

  const SaleStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme
        .extension<DashboardColors>()!;

    final normalized = status.toLowerCase();

    final color = _statusColor(
      normalized,
      colors,
      dashboardColors,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: color.withValues(alpha: .25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _statusIcon(normalized),
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            _statusLabel(normalized),
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(
    String status,
    ColorScheme colors,
    DashboardColors dashboardColors,
  ) {
    switch (status) {
      case 'paid':
        return dashboardColors.success;

      case 'cancelled':
      case 'refunded':
        return colors.error;

      case 'draft':
      case 'pending':
        return dashboardColors.warning;

      default:
        return colors.onSurfaceVariant;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'paid':
        return Icons.check_circle_outline;

      case 'cancelled':
        return Icons.cancel_outlined;

      case 'refunded':
        return Icons.replay;

      case 'draft':
      case 'pending':
        return Icons.schedule_outlined;

      default:
        return Icons.info_outline;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'paid':
        return 'sales.paid'.tr();

      case 'cancelled':
        return 'sales.cancelled'.tr();

      case 'refunded':
        return 'sales.refunded'.tr();

      case 'draft':
        return 'sales.draft'.tr();

      case 'pending':
        return 'sales.pending'.tr();

      default:
        return status;
    }
  }
}
