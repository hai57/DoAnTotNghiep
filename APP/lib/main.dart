// ignore_for_file: depend_on_referenced_packages, unused_import
// ignore_for_file: must_be_immutable


import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/bloc/darkmode/darkmode_bloc.dart';
import 'package:healthy_app/bloc/locale/locale_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/constant/locale.dart';
import 'package:healthy_app/store/index.dart';
import 'package:healthy_app/theme/index.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Store.init();
  await dotenv.load();
  if(!kReleaseMode && !kProfileMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi', 'VN'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthorizeBloc.instance,
          ),
          BlocProvider(
            create: (context) => UserBloc.instance,
          ),
          BlocProvider(
            create: (context) => DarkModeBloc.instance
          )
        ],
        child: const App(),
      ),
    ),
    
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    String? mode = Store.instance.getString(StoreKeys.darkmode) ?? 'light';
    DarkModeBloc.instance.add(DarkModeEventUpdate(mode));
    if(Store.instance.containsKey(StoreKeys.token)) {
      String token = Store.instance.getString(StoreKeys.token) ?? "";
      CoreApi.instance.setToken(token);
      AuthorizeBloc.instance.add(AuthorizeEventSuccess(token));
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState> (builder: (context, state) {
      return MaterialApp(
        title: 'HealthyApp',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routes: Routes.routesConfig,
        onGenerateRoute: Routes.onGenerateRoute,
        navigatorKey: navigatorKey,
        themeMode: ThemeMode.dark,
        theme: defaultTheme(context, type: state.mode),
        builder: EasyLoading.init(),
      );
    });
  }
}
