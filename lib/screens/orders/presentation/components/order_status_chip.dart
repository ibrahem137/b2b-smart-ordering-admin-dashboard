import 'package:dashboard/core/theme/extensions.dart';
import 'package:flutter/material.dart';

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final normalized = status.toLowerCase();

    final color = _statusColor(context, normalized);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withValues(alpha: .25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_statusIcon(normalized), size: 14, color: color),
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

  Color _statusColor(BuildContext context, String status) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final dashboardColors = theme.extension<DashboardColors>()!;

    switch (status) {
      case 'draft':
        return colors.onSurfaceVariant;

      case 'submitted':
        return dashboardColors.warning;

      case 'received':
        return dashboardColors.success;

      case 'cancelled':
        return colors.error;

      default:
        return colors.onSurfaceVariant;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'draft':
        return Icons.edit_note_outlined;

      case 'submitted':
        return Icons.schedule_outlined;

      case 'received':
        return Icons.check_circle_outline;

      case 'cancelled':
        return Icons.cancel_outlined;

      default:
        return Icons.info_outline;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'draft':
        return 'Draft';

      case 'submitted':
        return 'Submitted';

      case 'received':
        return 'Received';

      case 'cancelled':
        return 'Cancelled';

      default:
        return status;
    }
  }
}
