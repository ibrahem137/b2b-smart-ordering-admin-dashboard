import '../../domain/entities/admin.dart';

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

sealed class AuthState {
  const AuthState();
}

class AuthSuccess extends AuthState {
  final Admin admin;

  const AuthSuccess(this.admin);
}
