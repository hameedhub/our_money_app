import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _Register();
  }
}

class _Register extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[700],
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)),
       body: Stack(
            fit:  StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  gradient: LinearGradient(
                    colors:[ Colors.green[700], Colors.lightGreen[800]],
                    begin: Alignment.centerRight,
                    end: Alignment.bottomCenter
                  )
                ),
              ),
              ListView(
                children: <Widget>[
                  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Text("Setup account", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Saira Stencil One")),
                  ),
                  Padding(padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
                  child: Text("Let's get to know you better", style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Roboto")),
                  )
                  
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "First Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Last Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Email Address cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Password cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Address Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, right: 50.0, left: 50.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context)=> Login()
                    ));
                  },
                  child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                  ),
                  child: Text("Create Account", style: TextStyle(color: Colors.green[800], fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
                ),
                ),
                
              )
                ],
              )

            ])
    );
  }
}