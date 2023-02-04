import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/util/exceptions/exceptions.dart';
import 'package:netgeek/core/util/handlers/exception_handler.dart';
import 'package:netgeek/features/login/data/login_repository.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loggedIn({
    required String email,
    required String password,
  }) = _LoggedInEvent;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.idle() = LoginInitialState;

  const factory LoginState.loading() = LoginLoadingState;

  const factory LoginState.success() = LoginSuccessState;

  const factory LoginState.twoFactor() = LoginTwoFactorState;

  const factory LoginState.error({required Exception exception}) =
      LoginErrorState;
}

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  //final AuthBloc _authBloc;

  LoginBloc(
    // this._authBloc,
    this._loginRepository,
  ) : super(const LoginState.idle()) {
    on<LoginEvent>(
      (event, emitter) => event.map<Future<void>>(
        loggedIn: (event) => _loggedIn(event, emitter),
      ),
    );
  }

  Future<void> _loggedIn(
      _LoggedInEvent event, Emitter<LoginState> emitter) async {
    try {
      emitter(const LoginState.loading());

      final loginResponse = await _loginRepository.login(
        email: event.email,
        password: event.password,
      );

      emitter(const LoginState.success());
    } catch (error) {
      emitter(
        LoginState.error(
          exception: ExceptionHandler.handleError(error),
        ),
      );
      rethrow;
    }
  }
}
