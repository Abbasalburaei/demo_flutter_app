import 'package:first_app/core/components/text_input.dart';
import 'package:first_app/core/utils/app_settings.dart';
import 'package:first_app/pages/profile_page.dart';
import 'package:first_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import '../core/utils/wave_clipper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _password = TextEditingController();
  final _globalFormKey = GlobalKey<FormState>();

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
                      child: Text('Login',
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
                          hideSuffixIcon: true,
                          controller: _password,
                          label: 'Password',
                          prefixIconData: Icons.lock,
                          isPassword: true,
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
                        const SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              if (!_globalFormKey.currentState!.validate()) {
                                return;
                              }
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const ProfilePage()));
                            },
                            child: const Text('Login')),
                        const SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const RegisterPage()));
                          },
                          child: const Text('Register'),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
