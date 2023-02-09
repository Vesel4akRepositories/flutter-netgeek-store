import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/login/models/login_response.dart';

@injectable
class LoginRepository {
  final HttpManager _httpManager;

  LoginRepository(this._httpManager);

  Future<LoginResponse> login({
    required String email,
    required String password,
    String? twoStepCode,
  }) async {
    final response = await _httpManager.post(
      'token/',
      data: {
        'username': email,
        'password': password,
      },
    );

    return LoginResponse.fromJson(response.data);
  }
}
