import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netgeek/core/util/exceptions/exceptions.dart';
import 'package:netgeek/core/widget/dialogs/error_dialog.dart';

class DialogsManager extends StatefulWidget {
  const DialogsManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static DialogsManagerState of(BuildContext context) {
    final _DialogsManagerScope scope =
        context.dependOnInheritedWidgetOfExactType<_DialogsManagerScope>()!;
    return scope._errorDialogState;
  }

  static DialogsManagerState? maybeOf(BuildContext context) {
    final _DialogsManagerScope? scope =
        context.dependOnInheritedWidgetOfExactType<_DialogsManagerScope>();
    return scope?._errorDialogState;
  }

  @override
  State<DialogsManager> createState() => DialogsManagerState();
}

class DialogsManagerState extends State<DialogsManager> {
  void showError({required Exception exception}) {
    final errorMessage = _getErrorMessageByException(exception);

    if (errorMessage.isEmpty) return;

    showModalBottomSheet(
      context: context,
      builder: (_) => IntrinsicHeight(
        child: ErrorDialog(
          message: errorMessage,
        ),
      ),
    );
  }

  String _getErrorMessageByException(Exception exception) {
    if (exception is NetworkException) {
      return exception.message ?? '';
    } else if (exception is UnknownException) {
      return 'An unexpected error occurred';
    } else {
      return exception.toString();
    }
  }

  void showCustomModal({required Widget child}) {
    showModalBottomSheet(context: context, builder: (_) => child);
  }

  void showSnackBar({required String message}) {
    final scaffoldManager = ScaffoldMessenger.of(context);
    scaffoldManager.clearSnackBars();
    scaffoldManager.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _DialogsManagerScope(
      errorDialogState: this,
      child: widget.child,
    );
  }
}

class _DialogsManagerScope extends InheritedWidget {
  const _DialogsManagerScope({
    Key? key,
    required Widget child,
    required DialogsManagerState errorDialogState,
  })  : _errorDialogState = errorDialogState,
        super(key: key, child: child);

  final DialogsManagerState _errorDialogState;

  @override
  bool updateShouldNotify(_DialogsManagerScope old) =>
      _errorDialogState != old._errorDialogState;
}
