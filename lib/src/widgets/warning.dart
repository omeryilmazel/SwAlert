import 'package:flutter/material.dart';
import 'package:sw_alert/src/styles/colors.dart';

import '../../sw_alert.dart';

class SwWarning extends StatelessWidget {
  final String title;
  final String content;
  final String onConfirmText;
  final VoidCallback? onConfirm;
  final String onCancelText;
  final VoidCallback? onCancel;

  const SwWarning({
    Key? key,
    required this.title,
    required this.content,
    this.onConfirm,
    this.onConfirmText = 'Okay!',
    this.onCancel,
    this.onCancelText = 'Cancel',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:  EdgeInsets.all(32),
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xFF131517)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildImage(),
            buildTitle(),
            buildContent(),
            buttons(context),
          ],
        ),
      ),
    );
  }

  Container buildContent() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 0, right: 0),
      width: double.maxFinite,
      child: Center(
          child: Text(
        content,
        style: AlertTextStyle.content,
        textAlign: TextAlign.center,
      )),
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: Image.asset('assets/warning.png', height: 64, width: 64,package: 'sw_alert',),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Center(child: Text(title, style: AlertTextStyle.title)),
    );
  }

  Row buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (onCancel != null) {
              onCancel!();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 0,top: 16),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: SwColors.mainColor)),

              child: Text(
                onCancelText,
                style: TextStyle(
                    color: SwColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            if (onConfirm != null) {
              onConfirm!();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
              margin: EdgeInsets.only(bottom: 0,top: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: SwColors.mainColor),
              child: Text(onConfirmText, style: AlertTextStyle.buttonText)),
        ),
      ],
    );
  }
}
