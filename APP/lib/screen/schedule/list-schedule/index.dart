import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/response.dart';
import 'package:healthy_app/router/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScheduleList(label: 'Lịch trình của bạn')
        ],
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  const ScheduleList({required this.label, super.key});
  final String label;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<DayScheduleResponse> listRender = [];
  bool isLoading = true;

  void getListSchedule() async {
    final response = await ScheduleApi().getSchedule();
    if (response.items.isNotEmpty) {
          if (mounted) {
            setState(() {
              listRender = response.items;
              isLoading = false;
            });
          }
        }
   
  }

  @override
  void initState() {
    super.initState();
    getListSchedule();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.createSchedule);
                    }, 
                    icon: const Icon(Icons.add, color: AppColor.white1), 
                    label: const Text('Thêm', style: AppText.textWhite,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(widget.label, style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: isLoading
                ? LoadingAnimationWidget.newtonCradle(
                    color: AppColor.lightSecondColor,
                    size: 100,
                  )
                : Wrap(
                  alignment: WrapAlignment.spaceBetween,
                    children: List.generate(
                      listRender.length,
                      (index) => 
                        ScheduleDemoCard(
                          data: listRender[index],
                          index: index,
                          isLast: (index + 1) == listRender.length
                        )
                    )
                  ),
          )
        ]),
      ),
    );
  }
}

class ScheduleDemoCard extends StatelessWidget {
  const ScheduleDemoCard({
    super.key,
    required this.index,
    required this.data,
    required this.isLast
  });

  final int index;
  final bool isLast;
  final DayScheduleResponse data;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailSchedule, arguments: data.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          width: (screenWidth - 48)/2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 128,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent),
                  child: Image.asset(
                    'assets/images/demo-0${index % 3 + 1}.jpg',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 10),
              Text(
                data.nameSchedule,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
