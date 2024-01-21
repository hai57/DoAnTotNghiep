// ignore_for_file: must_be_immutable, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';

class ListDaySchedule extends StatefulWidget {
  ListDaySchedule({required this.changeScreen ,required this.schedule, super.key});

  Schedule schedule;
  Function changeScreen;

  @override
  State<ListDaySchedule> createState() => _ListDayScheduleState();
}

class _ListDayScheduleState extends State<ListDaySchedule> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("listday", style: AppText.titleLargeLight).tr(),
          TextButton(onPressed: () {

          }, child: const Text('viewmore').tr())
        ],
      ),
    );
  }
}
