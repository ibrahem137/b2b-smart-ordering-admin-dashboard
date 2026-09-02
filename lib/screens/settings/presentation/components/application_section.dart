import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:dashboard/core/theme/cubit/theme_state.dart';
import 'package:dashboard/screens/settings/presentation/components/settings_card.dart';
import 'package:dashboard/screens/settings/presentation/components/settings_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationSection extends StatelessWidget {
  const ApplicationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SettingsCard(
      title: 'Application',
      icon: Icons.tune_outlined,
      child: Column(
        children: [
          const SettingsInfoRow(
            icon: Icons.language_outlined,
            title: 'Language',
            value: 'English',
          ),

          const Divider(height: 30),

          const SettingsInfoRow(
            icon: Icons.dashboard_outlined,
            title: 'Application',
            value: 'B2B Admin Panel',
          ),

          const Divider(height: 30),

          const SettingsInfoRow(
            icon: Icons.info_outline,
            title: 'Version',
            value: '1.0.0',
          ),

          const Divider(height: 30),

          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Row(
                children: [
                  Icon(
                    _themeIcon(state.themeMode),
                    size: 20,
                    color: colors.onSurfaceVariant,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      'Theme',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),

                  DropdownButton<ThemeMode>(
                    value: state.themeMode,
                    underline: const SizedBox.shrink(),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: colors.surface,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: colors.onSurfaceVariant,
                    ),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    items: const [
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.system,
                        child: Text('System'),
                      ),
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      context.read<ThemeCubit>().changeTheme(value);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _themeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode_outlined;

      case ThemeMode.dark:
        return Icons.dark_mode_outlined;

      case ThemeMode.system:
        return Icons.brightness_auto_outlined;
    }
  }
}
