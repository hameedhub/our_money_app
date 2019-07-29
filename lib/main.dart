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
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        primaryColorDark: Colors.white,
        hintColor: Colors.white
      ),
      home: Load(),
      routes: routes,
    );
  }
}

