import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const String _adminTokenKey = 'admin_token';

  final FlutterSecureStorage storage;

  TokenStorage(this.storage);

  Future<void> deleteAdminToken() async {
    await storage.delete(key: _adminTokenKey);
  }

  Future<String?> getAdminToken() async {
    return storage.read(key: _adminTokenKey);
  }

  Future<bool> hasAdminToken() async {
    final token = await getAdminToken();

    return token != null && token.isNotEmpty;
  }

  Future<void> saveAdminToken(String token) async {
    await storage.write(key: _adminTokenKey, value: token);
  }
}
