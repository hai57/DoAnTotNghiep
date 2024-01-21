// ignore_for_file: prefer_final_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/screen/home/index.dart';
import 'package:healthy_app/screen/schedule/list-schedule/index.dart';
import 'package:healthy_app/screen/setting/index.dart';
import 'package:healthy_app/screen/stat/index.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _indexKey = 0;

  void _onItemTapped(int index) {
    setState(() {
      _indexKey = index;
    });
  }

  Widget body() {
    switch (_indexKey) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ScheduleScreen();
      case 2:
        return StatScreen();
      case 3:
        return const SettingScreen();
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.background, width: 1.0)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_down),
              label: 'statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'setting',
            ),
          ],
          currentIndex: _indexKey,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Theme.of(context).primaryColorLight,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
