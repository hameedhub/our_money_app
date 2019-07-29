import 'dart:async';

import 'package:flutter/material.dart';

class Load extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Load();
  }
}

class _Load extends State<Load> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/welcome'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FittedBox(
          child: Image.asset('images/welcome.jpeg'),
          fit: BoxFit.fill,
        )
      ],
    ));
  }
}
