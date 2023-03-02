import 'package:first_app/core/components/text_input.dart';
import 'package:first_app/core/utils/app_settings.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../core/utils/wave_clipper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _fullName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _globalFormKey = GlobalKey<FormState>();
  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    constraints: BoxConstraints(
                        minHeight: mediaSize.height / 3,
                        minWidth: mediaSize.width),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Register',
                          style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSettings.defaultPadding),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _globalFormKey,
                    child: Column(
                      children: [
                        TextInput(
                          controller: _emailController,
                          label: 'Email',
                          prefixIconData: Icons.email,
                          inputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Email mustn\'t be empty';
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(value);
                              if (value.isNotEmpty && !emailValid) {
                                return 'Email is invalid.';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextInput(
                          controller: _fullName,
                          label: 'Full name',
                          prefixIconData: Icons.person,
                          validator: (value) {
                            if (value != null) {
                              final names = value.split(' ');
                              if (names.length < 3) {
                                return 'Name must be at least three.';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextInput(
                          controller: _phoneNumber,
                          label: 'Phone number',
                          prefixIconData: Icons.phone,
                          inputType: TextInputType.phone,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty || value.length < 6) {
                                return 'Phone number mustn\'t be empty | less than 6 numbers.';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextInput(
                          hideSuffixIcon: true,
                          controller: _password,
                          label: 'Password',
                          prefixIconData: Icons.lock,
                          isPassword: _isPassword,
                          inputType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Password mustn\'t be empty.';
                              }
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextInput(
                          controller: _confirmPassword,
                          label: 'Confirm password',
                          prefixIconData: Icons.lock,
                          inputType: TextInputType.visiblePassword,
                          switchSuffixIcon: (state) {
                            setState(() {
                              _isPassword = !state;
                            });
                          },
                          isPassword: true,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value != null) {
                              return _password.value.text != value
                                  ? 'Not match password.'
                                  : null;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () {
                              if (!_globalFormKey.currentState!.validate()) {}
                            },
                            child: const Text('Register')),
                        const SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                          },
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
