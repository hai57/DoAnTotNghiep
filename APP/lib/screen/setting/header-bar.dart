// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/widget/common/information-parctice.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  var user = UserBloc.instance.state.user;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10,),
      SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.avt),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.username, style: Theme.of(context).textTheme.titleSmall),
                    Text(user.gmail, style: Theme.of(context).textTheme.titleSmall)
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_note),
                    color: Theme.of(context).colorScheme.onBackground,
                    iconSize: 34,
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const InformationPractice(false)
    ]);
  }
}
