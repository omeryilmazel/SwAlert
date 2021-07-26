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
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFFFFFFFF)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            buildImage(),
            buildContent(),
            SizedBox(height: 8),
            buttons(context),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  Container buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Image.asset('assets/warning.png', height: 90, width: 90,package: 'sw_alert',),
    );
  }

  Container buildTitle() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFFF2F2F2),
      height: 75,
      width: double.maxFinite,
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
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 46),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: SwColors.warningColor)),
            child: Center(
              child: Text(
                onCancelText,
                style: TextStyle(
                    color: SwColors.warningColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (onConfirm != null) {
              onConfirm!();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 46),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: SwColors.warningColor),
              child:
                  Center(child: Text(onConfirmText, style: AlertTextStyle.buttonText))),
        ),
      ],
    );
  }
}
