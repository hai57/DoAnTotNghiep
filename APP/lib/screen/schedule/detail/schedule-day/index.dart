// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/timer/index.dart';
import 'package:healthy_app/widget/dialog/dialog-show-itemssubactivity.dart';

class ScheduleDayDetail extends StatefulWidget {
  ScheduleDayDetail({required this.schedule, required this.changeIndex, super.key});
  Schedule schedule;
  Function changeIndex;
  @override
  State<ScheduleDayDetail> createState() => _ScheduleDayDetailState();
}

class _ScheduleDayDetailState extends State<ScheduleDayDetail> {
  int indexSelected = 0;
  List<Activity> listItems = [];

  void changeIndex (int newIndex) {
    setState(() {
      indexSelected = newIndex;
      listItems = widget.schedule.timeLine[newIndex].itemsActivity;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      listItems = widget.schedule.timeLine[indexSelected].itemsActivity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              widget.changeIndex(0);
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.schedule.type == "Week" ? SizedBox(
              height: 69,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.schedule.timeLine.length,
                itemBuilder: (context, index) => TextDayBlock(index: index, changeIndex: changeIndex, isActive: index == indexSelected)
              ),
            ) : const SizedBox(height: 0),
            const SizedBox(height: 16),
            const Text("Các hoạt dộng: ", style: AppText.titleLargeLight),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listItems.length,
                itemBuilder: (context, index) => DetailActivity(data: listItems[index])
              ),
            )
          ],
        )
      ),
    );
  }
}

class TextDayBlock extends StatelessWidget {
  TextDayBlock({
    super.key,
    required this.index,
    required this.changeIndex,
    required this.isActive
  });

  bool isActive;
  final int index;
  Function changeIndex;
  String renderTime(int index) {
    switch (index) {
      case 0:
        return 'mon';   
      case 1:
        return 'tue';
      case 2:
        return 'wed'; 
      case 3:
        return 'thu'; 
      case 4:
        return 'fri'; 
      case 5:
        return 'sat';      
      default:
        return 'sun';        
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeIndex(index);
      },
      child: Row(
        children: [
          Container(
            color: isActive ? AppColor.lightSecondColor: AppColor.lightPrimaryColor,
            height: double.infinity,
            width: 44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((index + 1).toString(), style: AppText.textWhite,),
                Text(renderTime(index),  style: AppText.textWhite).tr()
              ]),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}


class DetailActivity extends StatelessWidget {
  const DetailActivity({
    super.key,
    required this.data
  });

  final Activity data;

  String renderTime(String timeID) {
    List<Time> items = TimerBloc.instance.state.list;
    String data = "";
    for (var element in items) {
      if (element.id == timeID.toString()) {
        data = '${element.hour == 0 ? "00" : element.hour} : ${element.minutes == 0 ? "00" : element.minutes}';
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          barrierLabel: "Label",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 300),
          context: context,
          pageBuilder: (context, anim1, anim2) {
            return ShowItemsSubActivity(context, data.itemsSubActivity);
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
              child: child,
            );
          },
          );
      },
      child: Card(
        surfaceTintColor: Colors.white,
        borderOnForeground: false,
        margin: const EdgeInsets.only(top: 12),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(width: 1.0, color: AppColor.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name, style: Theme.of(context).textTheme.titleSmall),
              Text('${renderTime(data.startTime)} - ${renderTime(data.endTime)}', style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}
