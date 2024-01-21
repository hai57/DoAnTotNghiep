
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/sub-activity/index.dart';
import 'package:healthy_app/model/timer/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/subActivityBlock.dart';
import 'package:healthy_app/widget/dialog/add-sub-activity.dart';
import 'package:healthy_app/widget/dialog/timer-clock.dart';

class ListAcitivyRender extends StatefulWidget {
  ListAcitivyRender(
    this.data, {
    super.key,
  });
  late Activity data;

  @override
  State<ListAcitivyRender> createState() => _ListAcitivyRenderState();
}

class _ListAcitivyRenderState extends State<ListAcitivyRender> {
  String type = 'startTime';
  bool isActive = false;
  void addSubActivity(SubActivity data) {
    setState(() {
      widget.data.itemsSubActivity.add(SubActivity(
          duration: 10, subActivityName: data.subActivityName, subActivityId: data.subActivityId));
    });
  }

  void addSubSchedule(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AddSubActivityDialog(
            context, addSubActivity, widget.data.activityId));
  }

  void addTimer(int hour, int minutes) {
    List<Time> items = TimerBloc.instance.state.list;
    int id = 0;
    for (var element in items) {
      if (hour == element.hour && minutes == element.minutes) {
        id = int.parse(element.id);
        break;
      }
    }
    setState(() {
      if (type == 'startTime') {
        widget.data.startTime = id;
      } else {
        widget.data.endTime = id;
      }
    });
  }

  void openDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => TimerDialog(context, addTimer));
  }

  void changeType(String newType) {
    openDialog(context);
    setState(() {
      type = newType;
    });
  }

  String renderTime(int timeID) {
    List<Time> items = TimerBloc.instance.state.list;
    String data = "";
    for (var element in items) {
      if (element.id == timeID.toString()) {
        data = '${element.hour} : ${element.minutes}';
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 150,
                  child: Text(
                    'Thời gian bắt đầu :',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              Text(
                widget.data.startTime < 0
                    ? "Chưa chọn"
                    : renderTime(widget.data.startTime),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  changeType('startTime');
                },
                icon: const Icon(Icons.edit),
                style: ButtonStyle(iconSize: MaterialStateProperty.all(20)),
                color: AppColor.lightColor1,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            SizedBox(
                width: 150,
                child: Text('Thời gian kết thúc :', style: Theme.of(context).textTheme.titleSmall)),
            Text(
                widget.data.endTime < 0
                    ? "Chưa chọn"
                    : renderTime(widget.data.endTime),
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                changeType('endTime');
              },
              icon: const Icon(Icons.edit),
              style: ButtonStyle(iconSize: MaterialStateProperty.all(20)),
              color: AppColor.lightColor1,
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                addSubSchedule(context);
              },
              icon: const Icon(Icons.add, color: AppColor.white1,),
              label: const Text('Thêm lịch trình con', style: AppText.textWhite)),
          const SizedBox(
            height: 10,
          ),
          widget.data.itemsSubActivity.isNotEmpty
              ? Wrap(
                  spacing: 8.0, // Khoảng cách giữa các item
                  runSpacing: 8.0,
                  children: List.generate(
                      widget.data.itemsSubActivity.length,
                      (index) => SubActivityBlock(
                          data: widget.data.itemsSubActivity[index])))
              : Container(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
