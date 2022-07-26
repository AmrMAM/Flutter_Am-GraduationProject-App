import 'dart:async';

import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';

class CheckLatestVersion extends StatelessWidget {
  const CheckLatestVersion({Key? key, required this.onTap}) : super(key: key);

  final FutureOr Function() onTap;

  AmDataProvider<bool> _loadingProvider(BuildContext ctx) {
    return AmDataProvider<bool>(
      providerId: 'AM-ID-For-Providers_CheckVersionWidget${ctx.hashCode}',
      initialData: false,
    );
  }

  Future<void> _process(ctx) async {
    _loadingProvider(ctx).data = true;
    await onTap();
    _loadingProvider(ctx).data = false;
  }

  @override
  Widget build(BuildContext context) {
    return AmRefreshWidget<bool>(
      amDataProvider: _loadingProvider(context),
      builder: (ctx, value) {
        if (value == true) {
          return _loadingWidget();
        } else {
          return _mainWidget(context);
        }
      },
    );
  }

  InkWell _mainWidget(BuildContext context) {
    return InkWell(
      onTap: () => _process(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.update,
              color: Colors.lightBlue,
              size: 30,
            ),
            SizedBox(width: 10),
            const Text(
              'Check the latest version',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _loadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(color: Colors.lightBlue),
      ),
    );
  }
}
