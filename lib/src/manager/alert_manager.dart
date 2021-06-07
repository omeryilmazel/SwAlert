import 'package:flutter/material.dart';
import 'package:sw_alert/src/widgets/error.dart';
import 'package:sw_alert/src/widgets/rating.dart';
import 'package:sw_alert/src/widgets/success.dart';

import '../../sw_alert.dart';

class SwAlert {

  static Future<dynamic> success(BuildContext context,
      {required String title,
      required String content,
      String onConfirmText = 'Okay!',
      VoidCallback? onConfirm,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return SwSuccess(title: title, content: content,onConfirm: onConfirm,onConfirmText: onConfirmText);
      },
    );
  }

  static Future<dynamic> error(BuildContext context,
      {required String title,
      required String content,
      String onCancelText = 'Cancel',
      String onConfirmText = 'Okay!',
      VoidCallback? onCancel,
      VoidCallback? onConfirm,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return SwError(title: title, content: content,onConfirm: onConfirm,onConfirmText: onConfirmText,onCancel: onCancel,onCancelText: onCancelText);
      },
    );
  }

  static Future<dynamic> warning(BuildContext context,
      {required String title,
      required String content,
      String onCancelText = 'Cancel',
      String onConfirmText = 'Okay!',
      VoidCallback? onCancel,
      VoidCallback? onConfirm,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return SwWarning(title: title, content: content,onConfirm: onConfirm,onConfirmText: onConfirmText,onCancel: onCancel,onCancelText: onCancelText);
      },
    );
  }

  static Future<dynamic> rating(BuildContext context,
      {required String title,
      required String content,
      required String contentTitle,
      String? onCancelText,
      String? onConfirmText,
      VoidCallback? onCancel,
      VoidCallback? onConfirm,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return SwRating(title: title, content: content,onConfirm: onConfirm,onConfirmText: onConfirmText,contentTitle: contentTitle);
      },
    );
  }
}
