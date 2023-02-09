import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/core/util/validators/validators.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/login/bloc/login_bloc.dart';
import 'package:netgeek/features/registration/bloc/registration_bloc.dart';
import 'package:netgeek/features/registration/ui/pages/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginEvent.loggedIn(
              email: _loginController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _openRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<RegistrationBloc>(),
          child: const RegistrationPage(),
        ),
      ),
    );
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
                    'Login',
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
                        controller: _loginController,
                        validator: DefaultValidator().validate,
                        decoration: const InputDecoration(
                          labelText: 'Login',
                        ),
                      ),
                      const Gap(kPadding),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: PasswordValidator().validate,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const Gap(kPadding * 2),
                      ElevatedButton(
                        onPressed: _onLogin,
                        child: const Text('Log in'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Not registered yet?',
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: _openRegistration,
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: themeData.primaryColor,
                          ),
                        ),
                      )
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
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
