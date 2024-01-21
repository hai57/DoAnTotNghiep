// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/router/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;

  void _onLoginHandler(String userName, String password) async {
    final data = LoginRequest(gmail: userName, password: password);
    EasyLoading.show(status: 'loading...');
    setState(() {
      isLoading = true;
    });

    final loginResponse = await AuthorizeApi().login(data);
    AuthorizeBloc.instance.add(AuthorizeEventSuccess(loginResponse.token));
    UserBloc.instance.add(UserEventSuccess(loginResponse.user));
    Navigator.pushNamed(context, Routes.navigator);
    setState(() {
      isLoading = false;
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
              child: const Text('login', textAlign: TextAlign.center).tr()),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              renderInput(_usernameController, 'Email', 'placeholderEmail'),
              const SizedBox(height: 20),
              renderInput(
                  _passwordController, 'password', 'placeholderPassword'),
              const SizedBox(height: 30),
              IgnorePointer(
                ignoring: isLoading,
                child: ElevatedButton(
                    onPressed: () {
                      final userName = _usernameController.text;
                      final password = _passwordController.text;
                      _onLoginHandler(userName, password);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'login',
                        style: TextStyle(fontSize: 20, color: AppColor.white1),
                      ).tr(),
                    )),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColor.darkPrimaryColor,
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            'orContinueWith',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightColor2,
                            ),
                          ).tr(),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColor.darkPrimaryColor,
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'http://res.cloudinary.com/daroieekk/image/upload/v1705495985/DATN/google.png',
                            height: 28.0,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            'signInWithGoogle',
                            style: TextStyle(fontSize: 20.0),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'http://res.cloudinary.com/daroieekk/image/upload/v1705674310/DATN/apple.png',
                            height: 24.0,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            'signInWithApple',
                            style: TextStyle(fontSize: 20.0),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "registerContent".tr(),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'register'.tr(),
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, Routes.createScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Column renderInput(
      TextEditingController controller, String fieldName, String placeholder) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: 18),
        ).tr(),
        const SizedBox(height: 5),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              hintText: placeholder.tr(),
              hintStyle: const TextStyle(
                color: AppColor.lightColor2,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 89, 92, 91), width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 102, 90, 89), width: 1.0),
              ),
              suffixIcon: fieldName == "password"
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
