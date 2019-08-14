import 'package:flutter/material.dart';
import 'package:our_money_app/utilities/general.dart';

class Message extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    
    return _Message();
  }
}

class _Message extends State<Message>{
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Message', style: TextStyle(color: Colors.white,)),
        backgroundColor: Colors.green[300],
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white,)),
      body: Stack(
        children: <Widget>[whiteBackground(),
        ListView(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 10.0) ,
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 40.0),
                    child: Divider(
                      color: Colors.green,
                      height: 10.0,
                    )),
              ),),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
               child:  Text("Enter your message", style: TextStyle(color: Colors.green, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
              ),
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 10.0,) ,
                child: new Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Divider(
                      color: Colors.green,
                      height: 10.0,
                    )),
              ),)
            ]),
           Padding(
             padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
             child: Column(
               children: <Widget>[
                 inputForm('', 'Subject', TextInputType.text),
                 SizedBox(height: 20.0,),
                 TextField(
                    cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: 'Your message ...',
                        labelStyle: TextStyle(color: Colors.green,fontSize: 14.0),
                        fillColor: Colors.green,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.green, width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.green, width: 2.0,
                          ),
                        ),
                      ),
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                       style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                  ), 

                 
                 SizedBox(height: 20.0,),
                 successButton('Send', Colors.white)
               ],
             ),
           ),
           SizedBox(height: 20.0,),
          
          ],
        )
        ],
      )
      
    );
  }
}