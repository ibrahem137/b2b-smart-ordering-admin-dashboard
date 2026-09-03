import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/settings/presentation/components/account_section.dart';
import 'package:dashboard/screens/settings/presentation/components/application_section.dart';
import 'package:dashboard/screens/settings/presentation/components/security_section.dart';
import 'package:dashboard/screens/settings/presentation/cubit/settings_cubit.dart';
import 'package:dashboard/screens/settings/presentation/cubit/settings_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (_) => getIt<SettingsCubit>(),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLogoutSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
            (route) => false,
          );
        }

        if (state is SettingsLogoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colors.error,
              content: Text(
                state.message,
                style: TextStyle(color: colors.onError),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'settings.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'settings.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),
              const AccountSection(),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 900) {
                    return const Column(
                      children: [
                        ApplicationSection(),
                        SizedBox(height: 24),
                        SecuritySection(),
                      ],
                    );
                  }

                  return const Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ApplicationSection()),
                      SizedBox(width: 24),
                      Expanded(child: SecuritySection()),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
