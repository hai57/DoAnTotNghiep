// ignore_for_file: unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';

class CoverDetail extends StatelessWidget {
  CoverDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.detailCover),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft,
          repeat: ImageRepeat.noRepeat
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColor.lightPrimaryColor,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: AppColor.lightSecondColor,)),
                ),
                const SizedBox(width: 50),
                const Text('scheduleDetail',
                    style: TextStyle(
                        color: AppColor.white1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)).tr()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
