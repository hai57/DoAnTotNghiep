// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/model/user/index.dart';

class InformationPractice extends StatefulWidget {
  const InformationPractice(this.isBlur, {super.key});
  final bool isBlur;

  @override
  State<InformationPractice> createState() => _InformationPracticeState();
}

class _InformationPracticeState extends State<InformationPractice> {
  User user = UserBloc.instance.state.user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.infinity,
          height: 109,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.isBlur ?  const Color.fromRGBO(0, 0, 0, 0.57) : const Color.fromRGBO(0, 0, 0, 1),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                BoxText(data: user.weight, label: 'Cân nặng', unit: 'Kg'),
                SizedBox(
                  width: 2,
                  height: 30,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                ),
                BoxText(data: user.height, label: 'Chiều cao', unit: 'Cm'),
                SizedBox(
                  width: 2,
                  height: 30,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                ),
                const BoxText(data: '45', label: 'Phần trăm', unit: '%'),
              ],
            ),
          ),
        );
  }
}

class BoxText extends StatelessWidget {
  const BoxText(
      {super.key, required this.data, required this.label, required this.unit});

  final String data;
  final String label;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  data,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  unit,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
