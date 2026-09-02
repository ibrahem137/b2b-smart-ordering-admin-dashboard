import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/auth/data/models/admin_login_request.dart';
import 'package:dashboard/screens/auth/domain/repos/auth_repository.dart';

import 'auth_state.dart';

class AdminLoginCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AdminLoginCubit(this.authRepository) : super(const AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());

    final result = await authRepository.adminLogin(
      AdminLoginRequest(email: email, password: password),
    );

    result.when(
      success: (admin) {
        emit(AuthSuccess(admin));
      },
      failure: (error) {
        emit(AuthFailure(error.message ?? 'Something went wrong'));
      },
    );
  }
}
