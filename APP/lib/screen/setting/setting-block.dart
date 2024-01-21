// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/darkmode/darkmode_bloc.dart';
import 'package:healthy_app/model/setting/index.dart';
import 'package:healthy_app/store/index.dart';
import 'package:healthy_app/widget/dialog/change-langua.dart';

class SettingBlock extends StatefulWidget {
  const SettingBlock(
      {super.key, required this.listRender, required this.title});
  final List<SettingBlockItemModel> listRender;
  final String title;

  @override
  State<SettingBlock> createState() => _SettingBlockState();
}

class _SettingBlockState extends State<SettingBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(
          width: double.infinity,
          height: widget.listRender.length * 50,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.listRender.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.listRender[index].toogle
                  ? BlockSettingItemToogle(data: widget.listRender[index])
                  : BlockSettingItem(data: widget.listRender[index]);
            },
          ),
        )
      ],
    );
  }
}

class BlockSettingItem extends StatelessWidget {
  const BlockSettingItem({super.key, required this.data});
  final SettingBlockItemModel data;

  @override
  Widget build(BuildContext context) {
    bool isDark = DarkModeBloc.instance.state.mode == 'dark';
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          if (data.isPopup) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => ChangeLanguageDialog(context)
            );
          }
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide.none, padding: const EdgeInsets.all(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(isDark ? data.iconDark : data.iconLight,
                      cacheHeight: 24, cacheWidth: 24),
                  const SizedBox(width: 5),
                  Text(data.label.tr(),
                      style: Theme.of(context).textTheme.titleMedium)
                ]),
            Icon(Icons.arrow_forward_ios,
                size: 20, color: Theme.of(context).listTileTheme.iconColor)
          ],
        ),
      ),
    );
  }
}

class BlockSettingItemToogle extends StatelessWidget {
  const BlockSettingItemToogle({super.key, required this.data});
  final SettingBlockItemModel data;

  @override
  Widget build(BuildContext context) {
    bool isDark = DarkModeBloc.instance.state.mode == 'dark';

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Image.asset(isDark ? data.iconDark : data.iconLight,
                cacheHeight: 24, cacheWidth: 24),
            const SizedBox(width: 5),
            Text(
              data.label,
              style: Theme.of(context).textTheme.titleMedium,
            ).tr()
          ]),
          GestureDetector(
              onTap: () {
                var mode = DarkModeBloc.instance.state.mode;
                String modePush = mode == 'light' ? 'dark' : 'light';
                DarkModeBloc.instance.add(DarkModeEventUpdate(modePush));
                Store.instance.setString(StoreKeys.darkmode, modePush);
              },
              child: Icon(
                  DarkModeBloc.instance.state.mode == 'light'
                      ? Icons.toggle_off_outlined
                      : Icons.toggle_on_outlined,
                  size: 24,
                  color: Theme.of(context).listTileTheme.iconColor))
        ],
      ),
    );
  }
}
