import 'package:flutter/material.dart';
import 'load.dart';
var routes=<String, WidgetBuilder>{
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Money',
      home: Load(),
    );
  }
}

