import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  @JsonSerializable(explicitToJson: true)
  factory LoginResponse({
    required int id,
    required String email,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
