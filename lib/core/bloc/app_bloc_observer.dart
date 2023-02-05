import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    // Sending errors to Firebase crashlytics
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('State Bloc: $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Event Bloc: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    debugPrint('Close Bloc: $bloc');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Create Bloc: $bloc');
    super.onCreate(bloc);
  }
}
