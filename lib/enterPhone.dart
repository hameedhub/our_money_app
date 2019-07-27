import 'package:flutter/material.dart';

class EnterPhone extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _EnterPhone();
  }
}
class _EnterPhone extends State<EnterPhone>{


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
                    colors:[ Colors.green[700], Colors.lightGreenAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.bottomCenter
                  )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                  child: Text("Provide your Phone number", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
                  child: Text("You will be sent a one-time passcode to contine authorization", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                  
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child:  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      helperText: "Enter Phone Number", helperStyle: TextStyle(color:Colors.white),
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold), prefixText: "+234",),
                  ),)
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 500.0, left: 20.0, right: 20.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text("Continue", style: TextStyle(color: Colors.green[600], fontSize: 15.0, fontWeight: FontWeight.bold )),
                  ),
                  )
                )
              ],)
            ],
          )
     ) ;
  }
}