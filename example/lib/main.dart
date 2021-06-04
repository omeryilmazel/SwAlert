import 'package:flutter/material.dart';
import 'package:sw_alert/sw_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          SwAlert.show(context, type: AlertType.SUCCES, title: 'Title', content: Text('ASDSADSAdsadsadasdsa'));
        }, child: Text('Show Alert'))
      ),
    );
  }
}