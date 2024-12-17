import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/presentation/dialog/loading_dialog.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/login/presentation/cubit/login_cubit.dart';
import 'package:story_space/login/presentation/cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  final GlobalKey<FormState> _loginFormState = GlobalKey();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.login),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _loginFormState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/login.svg',
                        semanticsLabel: 'Login Logo',
                        fit: BoxFit.fitWidth,
                        width: 300,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        context.getString.welcomeBack,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: context.getString.enterEmail,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.getString.emailCannotBeEmpty;
                      }

                      if (!EmailValidator.validate(value)) {
                        return context.getString.invalidEmail;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: context.getString.enterPassword,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.getString.passwordCannotBeEmpty;
                      }

                      if (value.length < 8) {
                        return context.getString.invalidPassword;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: BlocListener<LoginCubit, LoginState>(
                      listenWhen: (previous, current) {
                        return previous != current;
                      },
                      listener: (context, state) {
                        if (state.isLoading) {
                          showLoadingDialog(context);
                          return;
                        }

                        context.pop(); // needed for dismiss loading dialog

                        if (state.isError && state.message.isNotEmpty) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(() {
                                  return state.message
                                      .replaceFirst('Exception: ', '');
                                }()),
                              ),
                            );
                          return;
                        }

                        context.go('/stories');
                      },
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_loginFormState.currentState?.validate() ==
                              true) {
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            Logger.log('Valid: continue login');

                            context
                                .read<LoginCubit>()
                                .login(email: email, password: password);
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () async {
                        final success = await context.push('/register');
                        if (success is bool && success == true) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content:
                                      Text(context.getString.successRegister)));
                          }
                        }
                      },
                      child: Text(context.getString.createNewAccount),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
