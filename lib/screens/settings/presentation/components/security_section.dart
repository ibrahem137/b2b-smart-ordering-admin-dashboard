import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/settings/presentation/components/settings_card.dart';
import 'package:dashboard/screens/settings/presentation/cubit/settings_cubit.dart';
import 'package:dashboard/screens/settings/presentation/cubit/settings_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme
        .extension<DashboardColors>()!;

    return SettingsCard(
      title: 'settings.security'.tr(),
      icon: Icons.security_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: dashboardColors.success.withValues(
                    alpha: .10,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.verified_user_outlined,
                  color: dashboardColors.success,
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'settings.current_session'.tr(),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'settings.session_description'.tr(),
                      style: theme.textTheme.bodySmall
                          ?.copyWith(
                            color: colors.onSurfaceVariant,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              final isLoading =
                  state is SettingsLogoutLoading;

              return SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: isLoading
                      ? null
                      : () => _showLogoutDialog(context),
                  icon: isLoading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.error,
                          ),
                        )
                      : Icon(
                          Icons.logout,
                          color: colors.error,
                        ),
                  label: Text(
                    isLoading
                        ? 'settings.logging_out'.tr()
                        : 'settings.logout'.tr(),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(
                          color: colors.error,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colors.error,
                    side: BorderSide(color: colors.error),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog(
    BuildContext context,
  ) async {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colors.outlineVariant),
          ),
          title: Text(
            'settings.logout'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'settings.logout_confirmation'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('settings.logout'.tr()),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      context.read<SettingsCubit>().logout();
    }
  }
}
