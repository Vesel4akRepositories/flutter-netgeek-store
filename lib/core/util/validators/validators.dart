abstract class ValidatorBase {
  String? validate(String? value);
}

class DefaultValidator extends ValidatorBase {
  @override
  String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }

    return null;
  }
}

class EmailValidator extends ValidatorBase {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    if (!_isValidEmail(value)) {
      return 'Некорректный E-Mail';
    }
    return null;
  }

  bool _isValidEmail(text) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);
}

class PasswordValidator extends ValidatorBase {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
