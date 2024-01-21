// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/sub-activity/index.dart';

class SubActivityBlock extends StatelessWidget {
  const SubActivityBlock({
    super.key,
    required this.data,
  });

  final SubActivity data;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.lightSecondColor,
            width: 1.5
          ),
          color: AppColor.lightSecondColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data.subActivityName,
            style: AppText.textWhite,
          ),
        ));
  }
}
