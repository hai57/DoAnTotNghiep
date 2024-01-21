// ignore_for_file: file_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/activity/activity_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';

class AddActivityDialog extends StatefulWidget {
  void Function(Activity) addActivity;
  
  AddActivityDialog(BuildContext context, this.addActivity, {super.key});

  @override
  State<AddActivityDialog> createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  int initialItem = 20;
  String dropdownValue = "";
  List<String> list = <String>['Day', 'Week'];
  List<Activity> listRender = [];

  void _onClose() {
    Navigator.pop(context);
  }

  void _onCheck(Activity data) {
    widget.addActivity(Activity(endTime: 1, name: data.name, activityId: data.activityId, startTime: 2, itemsSubActivity: []));
    _onClose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      listRender = ActivityBloc.instance.state.list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
              height: 50,
              width: 300,
              child: Stack(children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text(
                       "select",
                       style: AppText.titleLargeLight, textAlign: TextAlign.center
                     ).tr(),
                     const Text(" "),
                     const Text(
                       "activity",
                       style: AppText.titleLargeLight, textAlign: TextAlign.center
                     ).tr(),
                   ],
                 ),
                Positioned(
                  top: 0.0,
                  right: 5.0,
                  child: SizedBox(
                    width: 40,
                    height: 40.0,
                    child: IconButton(onPressed: _onClose, icon: const Icon(Icons.close)),
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: listRender.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text(listRender[index].name, style: AppText.textWhite,),
                              onPressed: () {
                                _onCheck(listRender[index]);
                              },
                            )
                          ),
                          const SizedBox(height: 10,)
                        ],
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
