import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/registration/models/registration_request.dart';

@injectable
class RegistrationRepository {
  final HttpManager _httpManager;

  RegistrationRepository(this._httpManager);

  Future<void> registerUser(RegistrationRequest request) async {
    try {
      await _httpManager.post(
        'accounts/register/',
        data: request.toJson(),
      );
    } catch (_) {
      rethrow;
    }
  }
}
