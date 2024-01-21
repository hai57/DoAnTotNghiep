// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/router/index.dart';

class IntroduceHome extends StatefulWidget {
  const IntroduceHome({super.key});

  @override
  State<IntroduceHome> createState() => _IntroduceHomeState();
}

class _IntroduceHomeState extends State<IntroduceHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 158,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xFFECF1F6),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 200,
                          child:  Text(
                            'Mọi người xứng đáng với một cuộc sống khỏe mạnh',
                            style: AppText.titleMediumLight,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.createSchedule);
                          },
                          child: const Text(
                            'Tạo lịch trình cho bạn!!!',
                            style: AppText.textWhite,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(const Color(0xFF1F4690)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: IgnorePointer(
                ignoring: true,
                child: SizedBox(
                  width: 146.0,
                  height: 158.0,
                  child: Image.asset(ImageConstant.introduce),
                              ),
              )),
          ],
        ),
      ),
    );
  }
}
