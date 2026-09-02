import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_error_model.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/core/services/admin_session.dart';
import 'package:dashboard/core/services/token_storage.dart';
import 'package:dashboard/screens/auth/data/models/admin_login_request.dart';
import 'package:dashboard/screens/auth/domain/entities/admin.dart';
import 'package:dashboard/screens/auth/domain/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;
  final TokenStorage tokenStorage;
  final AdminSession adminSession;

  AuthRepositoryImpl(this.apiService, this.tokenStorage, this.adminSession);

  @override
  Future<ApiResult<Admin>> adminLogin(AdminLoginRequest request) async {
    try {
      final response = await apiService.adminLogin(
        request.email,
        request.password,
      );

      final token = response.data?.token;
      final adminData = response.data?.admin;

      if (token == null || token.isEmpty) {
        return const ApiResult.failure(
          ApiErrorModel(message: 'Token was not returned from server.'),
        );
      }

      if (adminData == null) {
        return const ApiResult.failure(
          ApiErrorModel(message: 'Admin data was not returned from server.'),
        );
      }

      await tokenStorage.saveAdminToken(token);

      final admin = Admin(
        id: adminData.id,
        name: adminData.name,
        email: adminData.email,
      );

      adminSession.setAdmin(admin);

      return ApiResult.success(admin);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
