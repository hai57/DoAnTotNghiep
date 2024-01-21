// ignore_for_file: file_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/text.dart';

class TimerDialog extends StatefulWidget {
  TimerDialog(BuildContext context, this.addTimer,  {super.key});
  late Function addTimer;

  @override
  State<TimerDialog> createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  int initialItem = 0;
  int hours = 0;
  int minutes = 0;

  void _onClose() {
    Navigator.pop(context);
  }

  void _onSubmit() {
    widget.addTimer(hours, minutes);
    _onClose();
  }
  

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 350.0,
        width: 300.0,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: Stack(children: [
                 Center(
                  child: const Text("{select} Time",
                      style: AppText.titleLargeLight, textAlign: TextAlign.center).tr(),
                ),
                Positioned(
                    top: 5.0,
                    right: 5.0,
                    child: SizedBox(
                      width: 40,
                      height: 40.0,
                      child: IconButton(
                          onPressed: _onClose, icon: const Icon(Icons.close)),
                    )),
              ]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 40,
                      perspective: 0.0000000001,
                      overAndUnderCenterOpacity: 0.7,
                      controller: FixedExtentScrollController(initialItem: initialItem),
                      renderChildrenOutsideViewport: false,
                      useMagnifier: true,
                      magnification: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          hours = value;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 24,
                        builder: (context, index) {
                          return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                              child: Text(
                                index.toString(),
                                style: AppText.titleMediumLight,
                              ),),
                        );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 40,
                      perspective: 0.0000000001,
                      overAndUnderCenterOpacity: 0.7,
                      controller: FixedExtentScrollController(initialItem: initialItem),
                      renderChildrenOutsideViewport: false,
                      useMagnifier: true,
                      magnification: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          minutes = value*15;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 4,
                        builder: (context, index) {
                          return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                              child: Text(
                                (index * 15).toString(),
                                style: AppText.titleMediumLight,
                              ),),
                        );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: _onSubmit, child: const Text('Submit')),)
          ],
        ),
      ),
    );
  }
}

class MyData extends StatelessWidget {
  String currentData;
  bool  isHeight;
  MyData({super.key, required this.currentData, required this.isHeight});

  @override
  Widget build(BuildContext context) {
    final data = isHeight ? UserInforBloc.instance.state.height : UserInforBloc.instance.state.weight;
    final style = data == currentData ? AppText.textWhite : AppText.textSecondary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
          child: Text(
            currentData,
            style: style,
          ),),
    );
  }
}
