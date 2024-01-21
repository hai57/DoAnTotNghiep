// ignore_for_file: non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/user/index.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/user/index.dart';
import 'package:healthy_app/router/index.dart';

class ResultStatusScreen extends StatefulWidget {
  late Function(int) goPage;

  ResultStatusScreen(this.goPage, {super.key});

  @override
  State<ResultStatusScreen> createState() => _ResultStatusScreenState();
}

class _ResultStatusScreenState extends State<ResultStatusScreen> {
  bool isLoading = false;

  void _updateUser() async {
    final data = UserUpdateRequest(
      username: UserInforBloc.instance.state.userName,
      birthday: UserInforBloc.instance.state.birthday,
      gender: UserInforBloc.instance.state.gender,
      height: UserInforBloc.instance.state.height,
      weight: UserInforBloc.instance.state.weight
    );

    EasyLoading.show(status: 'loading...');
    setState(() {
      isLoading = true;
    });

    final loginResponse = await UserApi().updateUser(data);
    if (loginResponse.user.username != "") {
      Navigator.pushNamed(context, Routes.navigator);
    }
    
    setState(() {
      isLoading = false;
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('Result', style: AppText.titleLargeLight),
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => widget.goPage(1),
        )),
        body: BlocBuilder<UserInforBloc, UserInforState>(
            builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                FormValue('User Name', state.userName),
                FormValue('Height', state.height),
                FormValue('Weight', state.weight),
                FormValue('Gender', state.gender),
                FormValue('Birthday', state.birthday),
              ]),
            ),
          );
        }),
        floatingActionButton: Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(onPressed: _updateUser, child: const Text('Update', style: AppText.textWhite)),
              ),
            ),
        );
  }

  SizedBox FormValue(String label, String value) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [Text('$label: ', style: AppText.titleMediumLight,), const SizedBox(width: 10), Text(value, style: AppText.titleMediumLight,)],
      ),
    );
  }
}
