/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [AmLoadingButton] Widget                                                                           ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'dart:async';

import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '../statics/theme.dart';

class LoadingData {
  bool loading;
  Size size;
  double height = 0;
  set newSize(Size value) {
    height = (value.height > height) ? value.height : height;
    size = Size(value.width, height);
  }

  LoadingData({required this.loading, required this.size});
}

class AmLoadingButton extends StatelessWidget {
  const AmLoadingButton({
    Key? key,
    this.backgroundColor,
    required this.child,
    required this.onTap,
    this.horizontalPadding = 25,
    this.verticalPadding = 10,
    this.enabled = true,
  }) : super(key: key);

  final FutureOr Function() onTap;
  final Widget child;
  final Color? backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    final _loadingProvider = AmDataProvider<bool>(
      initialData: false,
      providerId: key?.toString(),
    );

    Future<void> _process() async {
      _loadingProvider.data = true;
      await onTap();
      _loadingProvider.data = false;
    }

    _insideBuild(val) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: val!
            ? const Center(
                child: CircularProgressIndicator(
                    // color: backgroundColor ?? theme.colorScheme.secondary,
                    ),
              )
            : ElevatedButton(
                onPressed: enabled == true ? _process : null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: child,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        backgroundColor ?? theme.colorScheme.secondary),
                    // elevation: MaterialStateProperty.all(5),
                    // textStyle: MaterialStateProperty.all(
                    //     theme.textTheme.button!.copyWith(fontSize: 18)),
                    shape: MaterialStateProperty.all((RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
              ),
      );
    }

    return SizedBox(
      // width: double.infinity,
      height: 65, // width: _loadingProvider.data!.size.width,
      child: AmRefreshWidget<bool>(
        amDataProvider: _loadingProvider,
        builder: (ctx, val) => _insideBuild(val),
      ),
    );
  }
}
