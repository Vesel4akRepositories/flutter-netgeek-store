import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/login/models/login_response.dart';

@injectable
class LoginRepository {
  final HttpManager _httpManager;

  LoginRepository(this._httpManager);

  Future<String> registerUser({
    required String email,
    required String password,
    required String passwordConfirm,
    String? inviteCode,
    required String gRecaptchaResponse,
  }) async {
    throw UnimplementedError();
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
    String? twoStepCode,
  }) async {
    final response = await _httpManager.post(
      'authMerchant',
      data: {
        'email': email,
        'password': password,
      },
    );

    return LoginResponse.fromJson(response.data);
  }
}
