import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/core/router/dash_router.dart';
import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:dashboard/core/theme/cubit/theme_state.dart';
import 'package:dashboard/core/theme/dash_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboard extends StatelessWidget {
  final DashRouter dashRouter;
  final String initialRoute;

  const AdminDashboard({
    super.key,
    required this.dashRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: DashTheme.light,
            darkTheme: DashTheme.dark,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: dashRouter.generateRoute,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
