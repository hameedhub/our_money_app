import 'package:flutter/material.dart';
import 'enterPhone.dart';

class Welcome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _Welcome();
  }
}
class _Welcome extends State<Welcome>{
  int photoIndex = 0;
  List<String> photos = [
    'images/welcome.jpeg'
  ];

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
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 500.0, left: 20.0, right: 20.0),
                    child: GestureDetector(
                     onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EnterPhone())
                      );},
                     child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text("Get Started", style: TextStyle(color: Colors.green[600], fontSize: 15.0, fontWeight: FontWeight.bold )),
                  )
                    ),
                  )
                )
              ],)
            ],
          )
     ) ;
  }
}