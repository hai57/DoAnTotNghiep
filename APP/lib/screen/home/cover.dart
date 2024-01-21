// ignore_for_file: unnecessary_const, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/widget/common/information-parctice.dart';

class CoverInformation extends StatelessWidget {
  CoverInformation({
    super.key,
  });

  var user = UserBloc.instance.state.user;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage(ImageConstant.avt),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                    color: AppColor.white1),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_add),
                    color: AppColor.white1),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chào ${user.username}',
            style: AppText.textWhite,
          ),
          const Text(
            'Bạn có',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const Text(
            'sẵn sàng?',
            style: TextStyle(fontSize: 30, color: Colors.white),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const InformationPractice(true)
    ]);
  }
}


