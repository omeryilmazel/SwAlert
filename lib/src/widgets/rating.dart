import 'package:flutter/material.dart';
import 'package:sw_alert/src/styles/colors.dart';

import '../../sw_alert.dart';

class SwRating extends StatelessWidget {
  final String title;
  final String content;
  final String? onConfirmText;
  final VoidCallback? onConfirm;
  final String? skipText;
  final String contentTitle;

  const SwRating({
    Key? key,
    required this.title,
    required this.content,
    required this.contentTitle,
    this.onConfirm,
    this.onConfirmText = 'Rate at App Store',
    this.skipText = 'Skip for now',
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
          children: [buildTitle(),buildImage(),buildContent(),buttons(context)],
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        Text(contentTitle, style: AlertTextStyle.contentTitle,textAlign: TextAlign.center),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.maxFinite,
          child: Center(
              child: Text(
            content,
            style: AlertTextStyle.content,
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Image.asset('assets/rate.png', height: 90, width: 120,package: 'sw_alert',),
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

  Widget buttons(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (onConfirm != null) {
              onConfirm!();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: SwColors.mainColor),
            child: Center(
              child: Text(onConfirmText ?? 'Rate at App Store', style: AlertTextStyle.buttonText,textAlign: TextAlign.center),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(onTap: () => Navigator.pop(context),child: Text(skipText ?? 'Skip for now', style: AlertTextStyle.skipText,textAlign: TextAlign.center)),
        )
      ],
    );
  }
}
