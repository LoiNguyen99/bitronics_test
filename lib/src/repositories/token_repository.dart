import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenRepository {

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    String? value = await storage.read(key: "access_token");
    return value;
  }

  Future<String?> getTokenType() async {
    String? value = await storage.read(key: "token_type");
    return value;
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: "access_token");
    if (value == null) {
      return false;
    }
    return true;
  }

  Future<void> saveToken(String token) async{
    await storage.write(key: 'access_token', value: token);
  }

  Future<void> saveTokenType(String token) async{
    await storage.write(key: 'token_type', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'access_token');
  }

}

