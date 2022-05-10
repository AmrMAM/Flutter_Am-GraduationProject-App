import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    Key? key,
    required this.text,
    required this.onTab,
    this.icon,
    this.centerNotStart = false,
    this.buttonStyle,
    this.height = 65,
    this.width = 300,
  }) : super(key: key);

  final String text;
  final Icon? icon;
  final void Function() onTab;
  final bool centerNotStart;
  final ButtonStyle? buttonStyle;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTab,
        style: buttonStyle,
        child: Row(
          mainAxisAlignment: centerNotStart
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            if (icon != null) icon!,
            if (icon != null)
              const VerticalDivider(
                thickness: 2,
                width: 30,
                indent: 8,
                endIndent: 8,
                color: Colors.white,
              ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
