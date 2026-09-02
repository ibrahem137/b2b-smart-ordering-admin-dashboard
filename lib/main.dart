import 'package:dashboard/admin_dashboard.dart';
import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/core/router/dash_router.dart';
import 'package:dashboard/core/router/routes.dart';
import 'package:dashboard/core/services/token_storage.dart';
import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  await getIt<ThemeCubit>().loadTheme();
  final token = await getIt<TokenStorage>().getAdminToken();

  final initialRoute = token != null && token.isNotEmpty
      ? Routes.mainScreen
      : Routes.loginScreen;

  runApp(AdminDashboard(dashRouter: DashRouter(), initialRoute: initialRoute));
}
