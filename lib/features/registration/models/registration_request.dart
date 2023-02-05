import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request.freezed.dart';
part 'registration_request.g.dart';

@freezed
class RegistrationRequest with _$RegistrationRequest {

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegistrationRequest({
    required String username,
    required String password,
    required String passwordConfirm,
    String? email,
    String? firstName,
    String? lastName,
  }) = _RegistrationRequest;

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);
}
