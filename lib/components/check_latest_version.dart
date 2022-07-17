import 'package:flutter/material.dart';

class CheckLatestVersion extends StatelessWidget {
  const CheckLatestVersion({Key? key, required this.onTap}) : super(key: key);

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
}
