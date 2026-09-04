import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:dashboard/screens/orders/presentation/cubit/update_order_status_cubit.dart';
import 'package:dashboard/screens/orders/presentation/cubit/update_order_status_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeOrderStatusDialog extends StatefulWidget {
  final OrderModel order;

  const ChangeOrderStatusDialog({super.key, required this.order});

  @override
  State<ChangeOrderStatusDialog> createState() =>
      _ChangeOrderStatusDialogState();
}

class _ChangeOrderStatusDialogState extends State<ChangeOrderStatusDialog> {
  final TextEditingController _notesController = TextEditingController();

  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<UpdateOrderStatusCubit, UpdateOrderStatusState>(
      listener: (context, state) {
        if (state is UpdateOrderStatusSuccess) {
          Navigator.of(context).pop(true);
        }

        if (state is UpdateOrderStatusFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: colors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is UpdateOrderStatusLoading;

        return AlertDialog(
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colors.outlineVariant),
          ),
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
          actionsPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          title: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.swap_horiz_rounded,
                  color: colors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'orders.change_status'.tr(),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'orders.change_status_subtitle'.tr(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'common.close'.tr(),
                onPressed: isLoading
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          content: SizedBox(
            width: 460,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderInfo(context),

                const SizedBox(height: 24),

                _buildCurrentStatus(context),

                const SizedBox(height: 20),

                _buildStatusField(context),

                const SizedBox(height: 20),

                _buildNotesField(context),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.of(context).pop();
                    },
              child: Text('common.cancel'.tr()),
            ),
            FilledButton.icon(
              onPressed: isLoading || _selectedStatus == null ? null : _submit,
              icon: isLoading
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.onPrimary,
                      ),
                    )
                  : const Icon(Icons.check_rounded),
              label: Text(
                isLoading
                    ? 'orders.updating_status'.tr()
                    : 'orders.update_status'.tr(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    final availableStatuses = _availableStatuses();

    if (availableStatuses.isNotEmpty) {
      _selectedStatus = availableStatuses.first;
    }
  }

  List<String> _availableStatuses() {
    switch (widget.order.status.toLowerCase()) {
      case 'draft':
        return ['submitted', 'cancelled'];

      case 'submitted':
        return ['received', 'cancelled'];

      default:
        return [];
    }
  }

  Widget _buildCurrentStatus(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'orders.current_status'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colors.outlineVariant),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: _statusColor(context, widget.order.status),
              ),
              const SizedBox(width: 8),
              Text(
                _statusLabel(widget.order.status),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotesField(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'orders.notes_optional'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _notesController,
          maxLines: 4,
          maxLength: 500,
          decoration: InputDecoration(
            hintText: 'orders.status_notes_hint'.tr(),
            alignLabelWithHint: true,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: Icon(Icons.notes_rounded),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderInfo(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
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
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              color: colors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PO-${widget.order.id.toString().padLeft(4, '0')}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _orderDescription(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusField(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final statuses = _availableStatuses();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'orders.new_status'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _selectedStatus,
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.flag_outlined),
            hintText: 'orders.select_new_status'.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          items: statuses.map((status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(_statusLabel(status)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
        ),
      ],
    );
  }

  String _orderDescription() {
    final storeName = widget.order.store?.name.trim();

    final supplierName = widget.order.supplier?.name.trim();

    if (storeName != null &&
        storeName.isNotEmpty &&
        supplierName != null &&
        supplierName.isNotEmpty) {
      return '$storeName — $supplierName';
    }

    if (storeName != null && storeName.isNotEmpty) {
      return storeName;
    }

    if (supplierName != null && supplierName.isNotEmpty) {
      return supplierName;
    }

    return 'orders.order'.tr();
  }

  Color _statusColor(BuildContext context, String status) {
    final colors = Theme.of(context).colorScheme;

    switch (status.toLowerCase()) {
      case 'draft':
        return colors.onSurfaceVariant;

      case 'submitted':
        return colors.primary;

      case 'received':
        return colors.tertiary;

      case 'cancelled':
        return colors.error;

      default:
        return colors.onSurfaceVariant;
    }
  }

  String _statusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return 'orders.draft'.tr();

      case 'submitted':
        return 'orders.submitted'.tr();

      case 'received':
        return 'orders.received'.tr();

      case 'cancelled':
        return 'orders.cancelled'.tr();

      default:
        return status;
    }
  }

  void _submit() {
    final status = _selectedStatus;

    if (status == null) {
      return;
    }

    final notes = _notesController.text.trim();

    context.read<UpdateOrderStatusCubit>().updateOrderStatus(
      id: widget.order.id,
      status: status,
      notes: notes.isEmpty ? null : notes,
    );
  }
}
