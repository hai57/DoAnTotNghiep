// ignore_for_file: file_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/sub-activity/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/subActivityBlock.dart';
import 'package:healthy_app/utils/common.dart';

class ShowItemsSubActivity extends StatefulWidget {
  ShowItemsSubActivity(BuildContext context, this.listRender, {super.key});
  List<SubActivity> listRender;

  @override
  State<ShowItemsSubActivity> createState() => _ShowItemsSubActivityState();
}

class _ShowItemsSubActivityState extends State<ShowItemsSubActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 400.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Stack(children: [
                    Center(
                      child: const Text(("subActivity"),
                              style: AppText.titleLargeLight,
                              textAlign: TextAlign.center)
                          .tr(),
                    ),
                    Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: SizedBox(
                          width: 40,
                          height: 40.0,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppColor.defaultColor,
                              )),
                        )),
                  ]),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                          widget.listRender.length,
                          (index) => SubActivityBlock(
                              data: widget.listRender[index]))),
                )
              ],
            ),
          )),
    );
  }
}
