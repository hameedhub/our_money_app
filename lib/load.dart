import 'package:flutter/material.dart';

class Load extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Load();
  }
}
class _Load extends State<Load>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            fit:  StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  gradient: LinearGradient(
                    colors:[ Colors.green[600], Colors.limeAccent[100]],
                    begin: Alignment.centerRight,
                    end: Alignment(-1.0, -1.0)
                  )
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Image.asset('images/logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('our ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0), ),
                        Text('m', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0), ),
                         Text('o', style: TextStyle(color: Colors.yellowAccent[700], fontWeight: FontWeight.bold, fontSize: 25.0), ),
                          Text('ney', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0), )
                      ],
                    ),
                  )
                  
                ],
              )
            ],
          )
    );
 }
}