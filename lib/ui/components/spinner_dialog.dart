

import 'package:flutter/material.dart';
import 'package:my_card/ui/helpers/i18n/resources.dart';

Future<void> showLoading(BuildContext context) async {
  await Future.delayed(Duration.zero);
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => SimpleDialog(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text(R.string.wait, textAlign: TextAlign.center),
          ],
        ),
      ],
    ),
  );
}

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}