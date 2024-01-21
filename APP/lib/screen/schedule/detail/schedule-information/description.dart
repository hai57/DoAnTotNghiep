// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/model/schedule/index.dart';

class DescriptionDetailSchedule extends StatefulWidget {
  const DescriptionDetailSchedule({required this.schedule, super.key});
  final Schedule schedule;

  @override
  State<DescriptionDetailSchedule> createState() =>
      _DescriptionDetailScheduleState();
}

class _DescriptionDetailScheduleState extends State<DescriptionDetailSchedule> {
  int length = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.schedule.nameSchedule,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE3E7EC),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.schedule),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.schedule.type,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE3E7EC),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.local_activity),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      length.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type."
                    ,
                    style: Theme.of(context).textTheme.titleSmall
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
