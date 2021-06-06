import 'package:flutter/material.dart';
import 'package:sw_alert/src/enums/alert_type.dart';
import 'package:sw_alert/src/styles/alert_style.dart';
import 'package:sw_alert/src/styles/colors.dart';

class SwAlertWidget extends StatefulWidget {
  final AlertType type;
  final String title;
  final String content;

  const SwAlertWidget(
      {Key? key,
      required this.type,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  _SwAlertWidgetState createState() => _SwAlertWidgetState();
}

class _SwAlertWidgetState extends State<SwAlertWidget> {
  late String image;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    setupUI();
  }

  setupUI() {
    if (widget.type == AlertType.SUCCES) {
      image = "success.png";
      buttonColor = SwColors.mainColor;
    } else if (widget.type == AlertType.ERROR) {
      image = "error.png";
      buttonColor = SwColors.errorColor;
    } else {
      image = "warning.png";
      buttonColor = SwColors.warningColor;
    }
  }

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
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFF2F2F2),
              height: 85,
              width: double.maxFinite,
              child: Center(
                  child: Text('Succes Popup Header', style: AlertStyle.title)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Image.asset('assets/$image', height: 90, width: 90),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.maxFinite,
              child: Center(
                  child: Text(
                widget.content,
                style: AlertStyle.content,
                textAlign: TextAlign.center,
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: widget.type != AlertType.SUCCES ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 46),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: buttonColor)
                          ),
                      child: Center(
                          child: Text('Cancel', style: TextStyle(color: buttonColor,fontWeight: FontWeight.bold,fontSize: 16)))) : Container(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 46),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: buttonColor),
                      child: Center(
                          child: Text('Okay!', style: AlertStyle.buttonText))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
