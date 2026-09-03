import 'package:dashboard/admin_dashboard.dart';
import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/core/router/dash_router.dart';
import 'package:dashboard/core/router/routes.dart';
import 'package:dashboard/core/services/token_storage.dart';
import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await setupDependencies();

  await getIt<ThemeCubit>().loadTheme();

  final token = await getIt<TokenStorage>().getAdminToken();

  final initialRoute = token != null && token.isNotEmpty
      ? Routes.mainScreen
      : Routes.loginScreen;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('tr'),
        Locale('de'),
        Locale('pt'),
        Locale('nl'),
        Locale('fr'),
        Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      saveLocale: true,
      child: AdminDashboard(
        dashRouter: DashRouter(),
        initialRoute: initialRoute,
      ),
    ),
  );
}
