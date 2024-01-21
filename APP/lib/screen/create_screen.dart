// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/router/index.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;

  void _onRegisterHandler(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password and Confirm Password do not match.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    final data = LoginRequest(gmail: email, password: password);
    EasyLoading.show(status: 'loading...');
    setState(() {
      isLoading = true;
    });

    final registerResponse = await AuthorizeApi().register(data);
    AuthorizeBloc.instance.add(AuthorizeEventSuccess(registerResponse.token));
    UserBloc.instance.add(UserEventSuccess(registerResponse.user));
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
            child: const Text('register', textAlign: TextAlign.center).tr()),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            renderInput(_emailController, "Email", 'placeholderEmail'),
            const SizedBox(height: 20),
            renderInput(_passwordController, "password", 'placeholderPassword'),
            const SizedBox(height: 20),
            renderInput(_confirmPasswordController, "confirmpassword",
                "placeholderConfirmPassword"),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: isLoading,
              child: ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;
                  _onRegisterHandler(email, password, confirmPassword);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'register',
                    style: AppText.textWhiteLarge,
                  ).tr(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "loginContent".tr(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'login'.tr(),
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, Routes.loginScreen);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              suffixIcon:
                  fieldName == "password" || fieldName == "confirmpassword"
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
