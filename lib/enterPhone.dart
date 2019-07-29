import 'package:flutter/material.dart';
import 'register.dart';

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
                  child: Text("Enter your phone number", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Saira Stencil One")),
                  ),
                  Padding(padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
                  child: Text("We'll send an SMS with a code to verify your phone number", style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Roboto")),
                  )
                  
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Enter Phone Number",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 15.0, fontFamily: "Quicksand"),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Phone Number cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      style: new TextStyle(
                        fontFamily: "Poppins", color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 500.0, left: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Register() ));
                    },

                    child:  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: Text("Continue", style: TextStyle(color: Colors.green[600], fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
                  ),
                  ) ,
                  )
                )
              ],)
            ],
          )
     ) ;
  }
}