import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/auth/data/models/admin_login_request.dart';
import 'package:dashboard/screens/auth/domain/entities/admin.dart';

abstract class AuthRepository {
  Future<ApiResult<Admin>> adminLogin(AdminLoginRequest request);
}
