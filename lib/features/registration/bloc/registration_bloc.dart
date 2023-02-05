import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/util/handlers/exception_handler.dart';
import 'package:netgeek/features/registration/data/registration_repository.dart';
import 'package:netgeek/features/registration/models/registration_request.dart';

part 'registration_bloc.freezed.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.register({
    required RegistrationRequest request,
  }) = _RegisterEvent;
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.idle() = RegistrationInitialState;

  const factory RegistrationState.loading() = RegistrationLoadingState;

  const factory RegistrationState.success() = RegistrationSuccessState;

  const factory RegistrationState.error({required Exception exception}) =
      RegistrationErrorState;
}

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _repository;

  RegistrationBloc(
    this._repository,
  ) : super(const RegistrationState.idle()) {
    on<RegistrationEvent>(
      (event, emitter) => event.map<Future<void>>(
        register: (event) => _registerUser(event, emitter),
      ),
    );
  }

  Future<void> _registerUser(
      _RegisterEvent event, Emitter<RegistrationState> emitter) async {
    try {
      emitter(const RegistrationState.loading());

      await _repository.registerUser(event.request);

      emitter(const RegistrationState.success());
    } catch (error) {
      emitter(
        RegistrationState.error(
          exception: ExceptionHandler.handleError(error),
        ),
      );
      rethrow;
    }
  }
}
