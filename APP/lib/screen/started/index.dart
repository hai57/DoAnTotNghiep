import 'package:flutter/material.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/screen/started/hello_screen.dart';
import 'package:healthy_app/screen/started/result.dart';
import 'package:healthy_app/screen/started/update_status_screen.dart';

class StartNavigation extends StatefulWidget {
  const StartNavigation({super.key});

  @override
  State<StartNavigation> createState() => _StartNavigationState();
}


class _StartNavigationState extends State<StartNavigation> {
  int _indexKey = 0;

  UserInforModel data = UserInforModel(
    userName: "",
    gender: "",
    height: "",
    weight: "",
    birthday: ""
  );

  void goPage(int key) {
    setState(() {
      _indexKey = key;
    });
  }

  Widget body() {
    switch(_indexKey) {
      case 0:
        return HelloScreen(goPage);
      case 1:
        return UpdateStatusScreen(goPage, data);
      case 2: 
      return ResultStatusScreen(goPage);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
