import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrdev_mobile_test/di/injector.dart';
import 'package:metrdev_mobile_test/features/auth/login/bloc/login_bloc.dart';
import 'package:validators/validators.dart';

import '../../../../core/common/svg_icons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/utility.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _emailController.text = "testuser@metrdev.com";
    _passwordController.text = "password";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, Routes.homeRoute);
            } else if (state is LoginFailure) {
              Utility.showAlert(context, 'Error', state.error);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Scaffold(
                  backgroundColor: bg.withOpacity(0.8),
                  body: const Center(
                    child: SpinKitFadingCircle(
                      color: mainGold,
                      size: 100,
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Log In",
                                    style: kWhiteText15w600Style.copyWith(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                            decoration: const BoxDecoration(
                              color: bgLight,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Email Address",
                                  style: kWhiteText15w600Style,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: bg,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextFormField(
                                    controller: _emailController,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'you@example.com',
                                      hintStyle: TextStyle(
                                        color: hintText,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 20.0,
                                      ),
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!isEmail(val)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  "Password",
                                  style: kWhiteText15w600Style,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: bg,
                                    borderRadius: BorderRadius.circular(
                                      30.0,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: _passwordVisible,
                                    obscuringCharacter: "●",
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (val.length < 8) {
                                        return 'Password must be atleast 8 characters';
                                      }
                                      // validator for password

                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Not less than 8 characters',
                                      hintStyle: const TextStyle(
                                        color: hintText,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 20.0,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      suffixIconColor: mainGold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _login();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        color: mainGold,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Log In",
                                      style: kDarkText16w600Style,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: bgLight,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "OR",
                                  style: kHintText15w600Style,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Divider(
                                    color: bgLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgIcons.googleIcon(),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgIcons.appleIcon(),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: kHintText15w600Style,
                              children: [
                                const TextSpan(text: "Don’t have an account? "),
                                TextSpan(
                                  text: "Sign up",
                                  style: const TextStyle(
                                      color: mainGold,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      // Invalid!
      return;
    }
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    locator<LoginBloc>().add(
      LoginButtonPressed(
        email: email,
        password: password,
      ),
    );
  }
}
