import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final storage = FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> write(String key, dynamic value) async {
    await storage.write(key: key, value: value.toString());
  }

  Future<void> remove(String key) async {
    await storage.delete(key: key);
  }

  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  static String id = 'id';
  static String email = 'email';
  static String nickname = 'nickname';

  // Map
}
