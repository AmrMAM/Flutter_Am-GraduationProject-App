import 'package:am_industrial4/screens/home/home.dart';
import 'package:am_industrial4/screens/node-red/node-red.dart';
import 'package:am_industrial4/screens/node-red_dashboard/node-red_dashboard.dart';

import '../screens/splash/splash.dart';
import '../screens/login/login.dart';

import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  ScreenSplash.screenId: (context) => const ScreenSplash(),
  ScreenLogin.screenId: (context) => const ScreenLogin(),
  ScreenHome.screenId: (context) => const ScreenHome(),
  ScreenNodeRED.screenId: (context) => const ScreenNodeRED(),
  ScreenNodeREDDashboard.screenId: (context) => const ScreenNodeREDDashboard(),
};
