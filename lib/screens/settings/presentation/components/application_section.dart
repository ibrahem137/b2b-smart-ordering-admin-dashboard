import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:dashboard/core/theme/cubit/theme_state.dart';
import 'package:dashboard/screens/settings/presentation/components/settings_card.dart';
import 'package:dashboard/screens/settings/presentation/components/settings_info_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationSection extends StatelessWidget {
  static const List<Locale> _supportedLocales = [
    Locale('en'),
    Locale('ru'),
    Locale('tr'),
    Locale('de'),
    Locale('pt'),
    Locale('nl'),
    Locale('fr'),
    Locale('es'),
  ];

  const ApplicationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SettingsCard(
      title: 'settings.application'.tr(),
      icon: Icons.tune_outlined,
      child: Column(
        children: [
          _buildLanguageRow(context, theme, colors),

          const Divider(height: 30),

          SettingsInfoRow(
            icon: Icons.dashboard_outlined,
            title: 'settings.application'.tr(),
            value: 'B2B Admin Panel',
          ),

          const Divider(height: 30),

          SettingsInfoRow(
            icon: Icons.info_outline,
            title: 'settings.version'.tr(),
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
                      'settings.theme'.tr(),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(
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
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                    items: [
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.system,
                        child: Text('themes.system'.tr()),
                      ),
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.light,
                        child: Text('themes.light'.tr()),
                      ),
                      DropdownMenuItem<ThemeMode>(
                        value: ThemeMode.dark,
                        child: Text('themes.dark'.tr()),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      context
                          .read<ThemeCubit>()
                          .changeTheme(value);
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

  Widget _buildLanguageRow(
    BuildContext context,
    ThemeData theme,
    ColorScheme colors,
  ) {
    final currentLocale = context.locale;

    return Row(
      children: [
        Icon(
          Icons.language_outlined,
          size: 20,
          color: colors.onSurfaceVariant,
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            'settings.language'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ),

        DropdownButton<Locale>(
          value: _findLocale(currentLocale),
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
          items: _supportedLocales.map((locale) {
            return DropdownMenuItem<Locale>(
              value: locale,
              child: Text(_languageLabel(locale).tr()),
            );
          }).toList(),
          onChanged: (locale) async {
            if (locale == null) {
              return;
            }

            if (locale == context.locale) {
              return;
            }

            await context.setLocale(locale);
          },
        ),
      ],
    );
  }

  Locale _findLocale(Locale currentLocale) {
    return _supportedLocales.firstWhere(
      (locale) =>
          locale.languageCode == currentLocale.languageCode,
      orElse: () => const Locale('en'),
    );
  }

  String _languageLabel(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'languages.english';

      case 'ru':
        return 'languages.russian';

      case 'tr':
        return 'languages.turkish';

      case 'de':
        return 'languages.german';

      case 'pt':
        return 'languages.portuguese';

      case 'nl':
        return 'languages.dutch';

      case 'fr':
        return 'languages.french';

      case 'es':
        return 'languages.spanish';

      default:
        return 'languages.english';
    }
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
