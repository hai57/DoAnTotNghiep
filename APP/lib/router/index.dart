import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/activity/activity_bloc.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/screen/create_screen.dart';

import 'package:healthy_app/screen/loading_screen.dart';
import 'package:healthy_app/screen/login_screen.dart';
import 'package:healthy_app/screen/create_screen.dart';
import 'package:healthy_app/screen/navigator/index.dart';
import 'package:healthy_app/screen/schedule/create/index.dart';
import 'package:healthy_app/screen/schedule/detail/index.dart';
import 'package:healthy_app/screen/schedule/list-schedule/index.dart';
import 'package:healthy_app/screen/started/index.dart';
import 'package:healthy_app/store/index.dart';

class RouteArg {
  final Map<String, dynamic>? values;
  RouteArg(this.values);
}

class Routes {
  static String navigator = '/navigator';
  static String loginScreen = '/login';
  static String createScreen = '/register';
  static String startScreen = '/start';
  static String loadingScreen = '/loading';
  static String registerScreen = '/register';
  static String scheduleScreen = '/schedule';
  static String createSchedule = '/create-schedule';
  static String detailSchedule = '/detail-schedule';

  static var routesConfig = {
    navigator: (context) => const NavigatorScreen(),
    loginScreen: (context) => const LoginScreen(),
    createScreen: (context) => const CreateScreen(),
    startScreen: (context) => BlocProvider(
        create: (context) => UserInforBloc.instance,
        child: const StartNavigation()),
    loadingScreen: (context) => const LoadingScreen(),
    scheduleScreen: (context) => const ScheduleScreen(),
    registerScreen: (context) => const CreateScreen(),
    detailSchedule: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TimerBloc.instance,
            ),
          ],
          child: const DetailSchedule(),
        ),
    createSchedule: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ActivityBloc.instance,
            ),
            BlocProvider(
              create: (context) => TimerBloc.instance,
            ),
          ],
          child: const CreateScheduleScreen(),
        ),
  };

  static Route<dynamic>? onGenerateRoute(settings) {
    const String rootRoute = "/";
    var routeName = (settings.name == rootRoute)
        ? Store.instance.containsKey(StoreKeys.token)
            ? Routes.loadingScreen
            : Routes.loginScreen
        : settings.name;
    // var  routeName = (settings.name == rootRoute) ? Routes.registerScreen : settings.name;
    if (Routes.routesConfig.containsKey(routeName)) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: settings.arguments),
        pageBuilder: (context, animation, secondaryAnimation) =>
            Routes.routesConfig[routeName]!(context),
        transitionsBuilder: defaultTransition,
      );
    }

    throw UnsupportedError('Unknown route: $routeName');
  }

  static Widget defaultTransition(
      context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
