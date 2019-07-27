import 'package:flutter/material.dart';
import 'load.dart';
import 'welcome.dart';

var routes=<String, WidgetBuilder>{
  '/welcome':(BuildContext context)=> Welcome()
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Money',
      home: Load(),
      routes: routes,
    );
  }
}

