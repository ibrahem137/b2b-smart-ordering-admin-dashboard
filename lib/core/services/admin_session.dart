import 'package:dashboard/screens/auth/domain/entities/admin.dart';

class AdminSession {
  Admin? _admin;

  Admin? get admin => _admin;

  bool get hasAdmin => _admin != null;

  void clear() {
    _admin = null;
  }

  void setAdmin(Admin admin) {
    _admin = admin;
  }
}
