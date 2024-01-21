import 'package:flutter/material.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/screen/home/category.dart';
import 'package:healthy_app/screen/home/cover.dart';
import 'package:healthy_app/screen/home/introduce.dart';
import 'package:healthy_app/screen/home/schedule.dart';
import 'package:healthy_app/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.homeCover),
              fit: BoxFit.fitHeight,
              repeat: ImageRepeat.noRepeat
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CoverInformation(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(94, 214, 194, 194),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(children: [
                  IntroduceHome(),
                  CategoryHome(),
                  ScheduleList(label: 'Lịch trình nổi tiếng',),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
