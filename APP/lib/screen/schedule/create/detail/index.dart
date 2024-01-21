// ignore_for_file: must_be_immutable, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/listActivity.dart';
import 'package:healthy_app/screen/schedule/create/detail/listday.dart';
import 'package:healthy_app/widget/dialog/add-activity.dart';

class CreateDetailSchedule extends StatefulWidget {
  late Schedule listSchedule;
  late Function(int) goPage;

  CreateDetailSchedule(this.goPage, this.listSchedule, {super.key});

  @override
  State<CreateDetailSchedule> createState() => _CreateDetailScheduleState();
}

class _CreateDetailScheduleState extends State<CreateDetailSchedule> {
  int onActive = 0;
  bool isEditing = false;
  DaySchedule currentDaySchedule = DaySchedule(itemsActivity: []);

  void changeActive(int index) {
    setState(() {
      onActive = index;
      for (var i = 0; i < widget.listSchedule.timeLine.length; i++) {
        if (onActive == i) {
          currentDaySchedule = widget.listSchedule.timeLine[i];
        }
      }
    });
  }

  void _addItem(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            AddActivityDialog(context, addActivity));
  }

  void addHourToActivity(String type, int timeID, int index) {
    Activity activityTemp =
        widget.listSchedule.timeLine[onActive].itemsActivity[index];
    final Activity data;
    if (type == "startTime") {
      data = Activity(
          endTime: activityTemp.endTime,
          activityId: activityTemp.activityId,
          startTime: timeID,
          name: activityTemp.name,
          itemsSubActivity: []);
    } else {
      data = Activity(
          endTime: timeID,
          activityId: activityTemp.activityId,
          startTime: activityTemp.startTime,
          name: activityTemp.name,
          itemsSubActivity: []);
    }

    setState(() {
      widget.listSchedule.timeLine[onActive].itemsActivity[index] = data;
    });
  }

  void addActivity(Activity dataResponse) {
    final Activity data = Activity(
        endTime: -1,
        activityId: dataResponse.activityId,
        startTime: -1,
        name: dataResponse.name,
        itemsSubActivity: []);
    setState(() {
      widget.listSchedule.timeLine[onActive].itemsActivity.add(data);
    });
    changeActive(onActive);
  }

  void removeItem (int index) {
    setState(() {
      currentDaySchedule.itemsActivity.removeAt(index);
    });
  }

  void createSchedule() async {
    final response = await ScheduleApi().createSchedule(widget.listSchedule);
    if (response == "Request Accepted") {
      Navigator.pushNamed(context, Routes.scheduleScreen);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("createschedule").tr(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onBackground),
          onPressed: () => widget.goPage(0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.listSchedule.timeLine.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListDay(context, index, changeActive, onActive);
                },
              ),
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          _addItem(context);
                        },
                        icon: Icon(Icons.add, color: AppColor.white1,),
                        label: Text('Thêm lịch trình',
                            style: AppText.textWhite)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                        icon: Icon(
                          isEditing ? Icons.format_list_bulleted_rounded : Icons.playlist_remove_rounded,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 30,
                        ))
                  ],
                )),
            SizedBox(
              height: height - 300,
              width: double.infinity,
              child: isEditing
                  ? ListViewEdit(currentDaySchedule: currentDaySchedule, removeItem: removeItem,)
                  : ListViewExpand(currentDaySchedule: currentDaySchedule),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                createSchedule();
              },
              child: Text("create", style: AppText.textWhiteLarge).tr()),
        ),
      ),
    );
  }
}

class ListViewEdit extends StatelessWidget {
  ListViewEdit({
    super.key,
    required this.currentDaySchedule,
    required this.removeItem
  });

  DaySchedule currentDaySchedule;
  Function removeItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: currentDaySchedule.itemsActivity.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: AppColor.borderColor,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(top: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentDaySchedule.itemsActivity[index].name,
                      style: Theme.of(context).textTheme.titleSmall),
                  IconButton(onPressed: () {
                    removeItem(index);
                  }, icon: Icon(Icons.delete_outline, color: Theme.of(context).listTileTheme.iconColor,))
                ],
              ),
            ),
          );
        });
  }
}

class ListViewExpand extends StatelessWidget {
  const ListViewExpand({
    super.key,
    required this.currentDaySchedule,
  });

  final DaySchedule currentDaySchedule;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: currentDaySchedule.itemsActivity.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: AppColor.borderColor,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(top: 16),
                child: ExpansionTile(
                  shape: const Border(),
                  collapsedBackgroundColor: Theme.of(context).colorScheme.background,
                  title: Text(currentDaySchedule.itemsActivity[index].name, style: Theme.of(context).textTheme.titleMedium),
                  backgroundColor: Colors.transparent,
                  children: <Widget>[
                    ListAcitivyRender(currentDaySchedule.itemsActivity[index])
                  ],
                ),
              )
            ],
          );
        });
  }
}
