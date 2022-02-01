import 'package:am_industrial4/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/animated_page.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);
  static const screenId = 'ScreenLogin';

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      minHeight: 0,
      uniqueId: screenId + '003',
      scaffold: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.login),
              SizedBox(width: 20),
              Text('Login'),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              flex: 1,
              child: WebView(
                userAgent: 'Amr_MAM',
                initialUrl: 'https://tender-deer-82.loca.lt',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            TextFormField(),
            MainButton(onTap: () {}, child: const Text('Login')),
            Container(),
          ],
        ),
      ),
    );
  }
}
