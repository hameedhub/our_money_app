import 'package:flutter/material.dart';
import 'register.dart';
import 'forgetPassword.dart';
import 'dashboard.dart';
import 'utilities/general.dart';

class Login extends StatefulWidget{
 @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
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
              ListView(
                children: <Widget>[
                       Column(
                children: <Widget>[
                  Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child:CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 40.0,
                    child: Image.asset('images/logo.png'),
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('our ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), ),
                        Text('m', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), ),
                         Text('o', style: TextStyle(color: Colors.yellowAccent[700], fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), ),
                          Text('ney', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), )
                      ],
                    ),
                  ),   
                ],
              ),
              Row(children: <Widget>[
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 30) ,
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 40.0),
                    child: Divider(
                      color: Colors.white,
                      height: 100,
                    )),
              ),),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
               child:  Text("Login", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: "Saira Stencil One" )),
              ),
              Expanded(
                child: Padding(
                padding: EdgeInsets.only(top: 30,) ,
                child: new Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Divider(
                      color: Colors.white,
                      height: 100.0,
                    )),
              ),)
            ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                          borderSide: new BorderSide(
                            color: Colors.white
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Phone number cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
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
                    padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 14.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(7.0),
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
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 25.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context)=> Dashboard()
                    ));
                  },
                  child: defaultButton('Login', Colors.green)
                )),
                ),
                Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 5.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context)=> ForgetPassword()
                    ));
                  },
                  child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text("Forget Password ?", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
                ),
                )),
                )
              ],),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Register(),
                      ));
                    },
                    child:  Text("Create an Account ?", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold,fontFamily: "Quicksand" )),
                  ),
                )
              ],)
               
                ],
              )
            ],
          )
    );
  }
}
