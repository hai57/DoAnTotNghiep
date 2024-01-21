import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/mockdata.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/screen/setting/header-bar.dart';
import 'package:healthy_app/screen/setting/setting-block.dart';
import 'package:healthy_app/store/index.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderBar(),
                const SizedBox(height: 16),
                SettingBlock(listRender: listRenderSecurity, title: 'Security'),
                const SizedBox(height: 16),
                SettingBlock(listRender: listRenderGeneral, title: 'General'),
                const SizedBox(height: 16),
                SettingBlock(listRender: listRenderAbout, title: 'About'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        height: 70,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: OutlinedButton(
            onPressed: () {
              Store.instance.remove(StoreKeys.token);
              Navigator.pushNamed(context, Routes.loginScreen);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFE970F), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              "logout",
              style: TextStyle(color: Color(0xFFFE970F)),
            ).tr(),
          ),
        ),
      ),
    );
  }
}

class FormControl extends StatefulWidget {
  const FormControl({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  State<FormControl> createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
              width: 150,
              child: Text(
                '${widget.label}: ',
                style: AppText.titleLargeLight,
              )),
          SizedBox(
              width: 200,
              child: Text(
                widget.value,
                style: Theme.of(context).textTheme.titleSmall,
              ))
        ],
      ),
    );
  }
}
