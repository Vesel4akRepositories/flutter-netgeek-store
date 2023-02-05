import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/util/validators/validators.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/registration/bloc/registration_bloc.dart';
import 'package:netgeek/features/registration/models/registration_request.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<RegistrationBloc>().add(
            RegistrationEvent.register(
              request: RegistrationRequest(
                username: _loginController.text,
                password: _passwordController.text,
                passwordConfirm: _confirmPasswordController.text,
                email: _emailController.text,
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                const Gap(kPadding),
                Text(
                  'Sign up',
                  style: themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(kPadding * 2),
                Column(
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
                    const Gap(kPadding),
                    TextFormField(
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: PasswordValidator().validate,
                      decoration: const InputDecoration(
                        labelText: 'Repeat password',
                      ),
                    ),
                    const Gap(kPadding * 2),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: EmailValidator().validate,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const Gap(kPadding),
                    TextFormField(
                      controller: _firstNameController,
                      autofillHints: const [AutofillHints.name],
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    const Gap(kPadding),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    const Gap(kPadding * 2),
                    ElevatedButton(
                      onPressed: _onRegister,
                      child: const Text('Sign up'),
                    ),
                  ],
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
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
