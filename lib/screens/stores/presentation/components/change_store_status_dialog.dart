import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_action_state.dart';
import 'package:dashboard/screens/stores/presentation/cubit/update_store_status_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeStoreStatusDialog extends StatelessWidget {
  final StoreModel store;

  const ChangeStoreStatusDialog({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final isActive = store.status.toLowerCase() == 'active';

    final newStatus = isActive ? 'inactive' : 'active';

    return BlocConsumer<UpdateStoreStatusCubit, StoreActionState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            Navigator.of(context).pop(true);
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final errorMessage = state.maybeWhen(
          failure: (message) => message,
          orElse: () => null,
        );

        return AlertDialog(
          title: Text(
            isActive
                ? 'stores.deactivate_store'.tr()
                : 'stores.activate_store'.tr(),
          ),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isActive
                      ? 'stores.deactivate_confirmation'.tr(
                          namedArgs: {'name': store.name},
                        )
                      : 'stores.activate_confirmation'.tr(
                          namedArgs: {'name': store.name},
                        ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),

                if (errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.error.withValues(alpha: .08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      errorMessage,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.error,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.of(context).pop(false);
                    },
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () {
                      context.read<UpdateStoreStatusCubit>().updateStatus(
                        id: store.id,
                        status: newStatus,
                      );
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      isActive
                          ? 'stores.deactivate'.tr()
                          : 'stores.activate'.tr(),
                    ),
            ),
          ],
        );
      },
    );
  }
}
