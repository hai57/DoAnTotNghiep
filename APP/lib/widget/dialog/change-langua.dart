// ignore_for_file: file_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

class ChangeLanguageDialog extends StatefulWidget {
  
  ChangeLanguageDialog(BuildContext context, {super.key});

  @override
  State<ChangeLanguageDialog> createState() => _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends State<ChangeLanguageDialog> {
  

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 400.0,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Stack(children: [
                const Center(
                  child: Text(
                    "Chọn ngôn ngữ",
                    style: AppText.titleLargeLight, textAlign: TextAlign.center
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: SizedBox(
                    width: 40,
                    height: 40.0,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close, color: AppColor.defaultColor,)),
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(onPressed: () {
                    context.setLocale(const Locale('en', 'US'));
                    Navigator.pop(context);
                  }, child: Text('en', style: AppText.textWhite).tr()),
                  ElevatedButton(onPressed: () {
                    context.setLocale(const Locale('vi', 'VN'));
                    Navigator.pop(context);
                  }, child: Text('vi', style: AppText.textWhite,).tr()),
                ],
              )
             
          ],
        )
      ),
    );
  }
}
