// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:intl/intl.dart';

class CupertinoDatePickerDialog extends StatefulWidget {
  const CupertinoDatePickerDialog(BuildContext context, {super.key});

  @override
  State<CupertinoDatePickerDialog> createState() => _CupertinoDatePickerDialogState();
}

class _CupertinoDatePickerDialogState extends State<CupertinoDatePickerDialog> {
  int initialItem = 20;

  void _onClose() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
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
                const Center(
                  child: Text(
                    "Select Birthday",
                    style: AppText.titleLargeLight, textAlign: TextAlign.center
                  ),
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
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(1969, 1, 1),
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (DateTime newDateTime) {
                    String formatter = DateFormat('yMd').format(newDateTime);
                    UserInforBloc.instance.add(UserEventUpdateBirthday(formatter.toString()));
                  },
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: _onClose, child: const Text('submit', style: AppText.textWhite).tr())),
          ],
        ),
      ),
    );
  }
}
