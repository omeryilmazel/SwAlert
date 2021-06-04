import 'package:flutter/material.dart';
import 'package:sw_alert/src/enums/alert_type.dart';
import 'package:sw_alert/src/widgets/alerts.dart';

class SwAlert {

  static Future<dynamic> show(BuildContext context,
      {required AlertType type,
      required String title,
      required Widget content}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return SwAlertWidget(type: type, title: title, content: content);
      },
    );
  }
}
