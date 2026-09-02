import 'package:bloc/bloc.dart';
import 'package:dashboard/core/services/admin_session.dart';
import 'package:dashboard/core/services/token_storage.dart';
import 'package:dashboard/screens/auth/domain/entities/admin.dart';

import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final TokenStorage tokenStorage;
  final AdminSession adminSession;

  SettingsCubit(this.tokenStorage, this.adminSession)
    : super(const SettingsInitial());

  Admin? get admin => adminSession.admin;

  Future<void> logout() async {
    emit(const SettingsLogoutLoading());

    try {
      await tokenStorage.deleteAdminToken();

      adminSession.clear();

      emit(const SettingsLogoutSuccess());
    } catch (error) {
      emit(const SettingsLogoutFailure('Failed to logout'));
    }
  }
}
