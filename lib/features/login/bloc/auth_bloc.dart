import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/features/login/data/token_repository.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _AuthStartedEvent;

  const factory AuthEvent.loggedIn({
    required String accessToken,
    required String refreshToken,
  }) = _AuthLoginEvent;

  const factory AuthEvent.loggedOut() = _AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  AuthState._();

  bool get isAuthenticated => maybeWhen(
        authenticated: () => true,
        orElse: () => false,
      );

  factory AuthState.uninitialized() = AuthUninitializedState;

  factory AuthState.authenticated() = AuthenticatedState;

  factory AuthState.unauthenticated() = UnauthenticatedState;
}

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenRepository _tokenRepository;

  AuthBloc(
    this._tokenRepository,
  ) : super(AuthState.uninitialized()) {
    on<AuthEvent>(
      (event, emitter) => event.map<Future<void>>(
        started: (event) => _appStarted(event, emitter),
        loggedIn: (event) => _loggedIn(event, emitter),
        loggedOut: (event) => _loggedOut(event, emitter),
      ),
    );
  }

  Future<void> _appStarted(
      _AuthStartedEvent event, Emitter<AuthState> emitter) async {
    final accessToken = await _tokenRepository.readAccessToken();
    final hasToken = accessToken != null && (accessToken.isNotEmpty);
    if (hasToken) {
      emitter(AuthState.authenticated());
    } else {
      emitter(AuthState.unauthenticated());
    }
  }

  Future<void> _loggedIn(
      _AuthLoginEvent event, Emitter<AuthState> emitter) async {
    try {
      final accessToken = event.accessToken;
      final refreshToken = event.refreshToken;

      _tokenRepository.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      emitter(AuthState.authenticated());
    } catch (_) {
      rethrow;
    }
  }

  Future<void> _loggedOut(
      _AuthLogoutEvent event, Emitter<AuthState> emitter) async {
    try {
      _tokenRepository.clearTokens();
      emitter(AuthState.unauthenticated());
    } catch (_) {
      rethrow;
    }
  }
}
