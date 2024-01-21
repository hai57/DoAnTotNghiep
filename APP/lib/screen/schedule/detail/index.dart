import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/timer/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-day/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/index.dart';

class DetailSchedule extends StatefulWidget {
  const DetailSchedule({super.key});

  @override
  State<DetailSchedule> createState() => _DetailScheduleState();
}

class _DetailScheduleState extends State<DetailSchedule> {
  int indexKey = 0;
  var scheduleDetail = Schedule(nameSchedule: "", type: "", timeLine: [], id: "");
  
  void getSchedule() async {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    final response = await ScheduleApi().getDetailSchedule(id);
    setState(() {
      scheduleDetail = response.schedule;
    });
  }

  void getTimer() async {
    List<Time> dataCheck = TimerBloc.instance.state.list;
    if (dataCheck.isEmpty) {
      final response = await ScheduleApi().getTimer();
      TimerBloc.instance.add(TimerEventUpdateSchedule(list: response.timers));
    }
  } 

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getSchedule();
    });
    getTimer();
  }

  void changeIndex (int newIndex) {
    setState(() {
      indexKey = newIndex;
    });
  }

  Widget body() {
    switch(indexKey) {
      case 0:
        return ScheduleInformation(schedule: scheduleDetail, changeIndex: changeIndex);
      case 1:
        return ScheduleDayDetail(schedule: scheduleDetail, changeIndex: changeIndex);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
