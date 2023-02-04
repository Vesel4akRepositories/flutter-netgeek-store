import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/util/validators/validators.dart';
import 'package:netgeek/core/widget/gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onLogin() {
    if (_formKey.currentState!.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(kPadding * 4),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Вход',
                    style: themeData.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(kPadding * 2),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: EmailValidator().validate,
                        decoration: const InputDecoration(
                          labelText: 'Почта',
                        ),
                      ),
                      const Gap(kPadding),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Пароль',
                        ),
                      ),
                      const Gap(kPadding * 2),
                      ElevatedButton(
                        onPressed: _onLogin,
                        child: const Text('Войти'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
