import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './statics/theme.dart';
import './statics/routes.dart';
import './screens/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (Platform.isAndroid) {
    WebView.platform = AndroidWebView();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intelligent Manufacturing Using Industry 4.0',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      routes: routes,
      initialRoute: ScreenSplash.screenId,
    );
  }
}