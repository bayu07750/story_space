import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/presentation/dialog/loading_dialog.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/register/presentation/cubit/register_cubit.dart';
import 'package:story_space/register/presentation/cubit/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  final GlobalKey<FormState> _registerFormState = GlobalKey();

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.register),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _registerFormState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/sign_up.svg',
                        semanticsLabel: 'Login Logo',
                        fit: BoxFit.fitWidth,
                        width: 300,
                        height: 300,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        context.getString.createNewAccount,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: context.getString.enterName,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.getString.nameCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
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
                    child: BlocListener<RegisterCubit, RegisterState>(
                      listenWhen: (previous, current) {
                        return previous != current;
                      },
                      listener: (context, state) {
                        if (state.isLoading) {
                          showLoadingDialog(context);
                          return;
                        }

                        context.pop(); // dismiss loading dialog

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

                        context.pop(true);
                      },
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_registerFormState.currentState?.validate() ==
                              true) {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            final name = _nameController.text;

                            Logger.log('Valid: continue register');

                            final cubit = context.read<RegisterCubit>();
                            cubit.register(
                                name: name, email: email, password: password);
                          }
                        },
                        child: Text(context.getString.register),
                      ),
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
