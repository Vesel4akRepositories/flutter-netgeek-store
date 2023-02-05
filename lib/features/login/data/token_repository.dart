import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenRepository {
  TokenRepository(this._flutterSecureStorage);

  static const _tokenKey = 'tokenKey';
  static const _refreshTokenKey = 'refreshTokenKey';
  final FlutterSecureStorage _flutterSecureStorage;

  Future<String?> readAccessToken() async {
    final accessToken = await _flutterSecureStorage.read(key: _tokenKey);

    return accessToken;
  }

  Future<String?> readRefreshToken() async {
    final refreshToken =
        await _flutterSecureStorage.read(key: _refreshTokenKey);

    return refreshToken;
  }

  void saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _flutterSecureStorage.write(
      key: _tokenKey,
      value: accessToken,
    );

    await _flutterSecureStorage.write(
      key: _refreshTokenKey,
      value: refreshToken,
    );
  }

  void clearTokens() async {
    await _flutterSecureStorage.deleteAll();
  }
}
