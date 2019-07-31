import 'package:flutter/material.dart';

class AddCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddCard();
  }
}

class _AddCard extends State<AddCard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green[300],
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white,)),
    body: ListView(
      children: <Widget>[
        SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child:  Container(
                  alignment: Alignment.center,
                      height: 40.0,
                      width: 500.0,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[50],
                        borderRadius: BorderRadius.circular(7.0)
                      ),
                     child:Padding(
                       padding: EdgeInsets.only(left: 10.0, right: 10.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                          Icon(Icons.lock_outline, color: Colors.red[200],),
                          Text(' Your card details are secured by PayStack', 
                          style: TextStyle(color: Colors.red[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          ),)
                         ],
                       )
                     )
                ),
              ),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 10) ,
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 40.0),
                    child: Divider(
                      color: Colors.green,
                      height: 100,
                    )),
              ),),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
               child:  Text("Enter your card details", style: TextStyle(color: Colors.green, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
              ),
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 10,) ,
                child: new Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Divider(
                      color: Colors.green,
                      height: 100.0,
                    )),
              ),)
            ]),
            Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: "0000 0000 0000 0000",
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Card Number",
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
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Row(
                    children: <Widget>[
                     Expanded(
                       child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: "MM/YY",
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Card Expiry",
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
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                     ),
                     Expanded(
                       child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: "123",
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "CVV",
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
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                     ),
                    ],
                  )
                ],
              ),
                
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green[300],
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(7.0)
                      ),
                      child: Text("Pay NGN 30", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),)
                    ),
                  )
                ],
              ),

      ],
    ),   
    );
  }
}