import 'package:flutter/material.dart';
import 'package:sw_alert/sw_alert.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                SwAlert.success(context,
                    title: 'SUCCESS',
                    content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    onConfirmText: 'Cancel');
              },
              child: Text('Show Success')),
          ElevatedButton(
              onPressed: () {
                SwAlert.error(context,
                    title: 'ERROR',
                    content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    onConfirmText: 'Premium Al');
              },
              child: Text('Show Error')),
          ElevatedButton(
              onPressed: () {
                SwAlert.warning(context,
                    title: 'WARNING',
                    content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    onConfirm: (){
                      print(":D");
                    },
                    onConfirmText: 'Cancel');
              },
              child: Text('Show Warning')),
          ElevatedButton(
              onPressed: () {
                SwAlert.rating(context,
                    title: 'Rating Title',
                    content: 'Recommend us to others by rating us on App Store',
                    contentTitle: 'Like using Lizard?'
                    );
              },
              child: Text('Show Rating'))
        ],
      )),
    );
  }
}
