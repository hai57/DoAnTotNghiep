import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/bloc/activity/activity_bloc.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/timer/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/index.dart';
import 'package:healthy_app/screen/schedule/create/informataion.dart/index.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  int _indexKey = 0;
  Schedule listSchedule = Schedule(nameSchedule: "", type: "Day", timeLine: [DaySchedule(itemsActivity: [])]);
  
  List<Schedule> listShedule = [];
  int lengthList = 1;
  int onActive = 0;

  void goPage(int key) {
    setState(() {
      _indexKey = key;
    });
  }

  void changeType (String type) {
    Schedule tempListSchedule = Schedule(nameSchedule: listSchedule.nameSchedule, type: type, timeLine: []);
    if (type == "Day") {
      tempListSchedule.timeLine.add(DaySchedule(itemsActivity: []));
    } else {
      for (var i = 0; i < 7; i++) {
        tempListSchedule.timeLine.add(DaySchedule(itemsActivity: []));
      }
    }
    setState(() {
      listSchedule = tempListSchedule;
    });
  }

  void changeName (String name) {
    Schedule tempListSchedule = Schedule(nameSchedule: name, type: listSchedule.type, timeLine: listSchedule.timeLine);
    setState(() {
      listSchedule = tempListSchedule;
    });
  }

  void getAcitivies() async {
    List<Activity> dataCheck = ActivityBloc.instance.state.list;
    if (dataCheck.isEmpty) {
      final response = await ScheduleApi().getListActivity();
      ActivityBloc.instance.add(ActivityEventUpdateSchedule(list: response.items));
    }
  } 

  void getTimer() async {
    List<Time> dataCheck = TimerBloc.instance.state.list;
    if (dataCheck.isEmpty) {
      final response = await ScheduleApi().getTimer();
      TimerBloc.instance.add(TimerEventUpdateSchedule(list: response.timers));
    }
  } 
  
  Widget body() {
    switch(_indexKey) {
      case 0:
        return CreateInforSchedule(goPage, changeType, changeName, listSchedule);
      case 1:
        return CreateDetailSchedule(goPage, listSchedule);
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
    getAcitivies();
    getTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
