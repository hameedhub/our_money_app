import 'package:flutter/material.dart';
import 'package:our_money_app/model/User.dart';
import 'package:our_money_app/routes/forgetPassword.dart';
import 'package:our_money_app/routes/index.dart';
import 'package:our_money_app/routes/register.dart';
import 'package:our_money_app/services/storage.dart';
import 'package:our_money_app/utilities/general.dart';
import 'package:our_money_app/services/api_service.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}


class _Login extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _phone;
  String _password;
  bool _isWorking = false;
  String token = '';

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}
_isLoading(){
      setState((){
        _isWorking = true;
      });
    }
    _isNotLoading(){
      setState((){
        _isWorking= false;
      });
    }
  validate() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      _isLoading();
      _formKey.currentState.save();
      try{
        var result = await ApiService.postData({'phone': _phone, 'password': _password }, 'auth/login');
        if (result.containsKey('token')) {
          token =result['token'].toString();
          saveData(result['data'].toString());
                  } else {
                    _isNotLoading();
                    showInSnackBar(result['error'].toString());
                  }
      }catch(e){
       _isNotLoading();
       showInSnackBar('Service not available, please try again later');
      }
      } else {
                
                print('form is invalid');
              }
       
            }
            
          
            @override
            void initState() {
              super.initState();
            }
          
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                key: _scaffoldKey,
                  body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  greenBackground(),
                  ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 40.0,
                              child: Image.asset('images/logo.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'our ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: "Saira Stencil One"),
                                ),
                                Text(
                                  'm',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: "Saira Stencil One"),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                      color: Colors.yellowAccent[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: "Saira Stencil One"),
                                ),
                                Text(
                                  'ney',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: "Saira Stencil One"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 40.0),
                                child: Divider(
                                  color: Colors.white,
                                  height: 100,
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Saira Stencil One")),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: new Container(
                                margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                                child: Divider(
                                  color: Colors.white,
                                  height: 100.0,
                                )),
                          ),
                        )
                      ]),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 30.0, right: 30.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        prefixText: '+234',
                                        labelText: "Phone Number",
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'Phone number can\'t be empty'
                                          : null,
                                      onSaved: (value) => _phone = value,
                                      keyboardType: TextInputType.phone,
                                      style: new TextStyle(
                                          height: 0.3,
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                      maxLength: 10,
                                    ))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 30.0, left: 30.0, right: 30.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'Password can\'t be empty'
                                          : null,
                                      onSaved: (value) => _password = value,
                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                          height: 0.3,
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                           Container(
                              child: Visibility(
                                visible:_isWorking,
                                child: Container(
                                  padding: EdgeInsets.only(top: 20.0, left: 80.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
          
                                replacement: Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 25.0,),
                                  child: GestureDetector(
                                    onTap: () {
                                      validate();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height:50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        child: defaultButton('Login', Colors.green)),
                                  ),
                                )),
                              ),
                            ),
                          // Expanded(
                          //   child: Padding(
                          //       padding: EdgeInsets.only(top: 20.0, left: 25.0),
                          //       child: GestureDetector(
                          //           onTap: () {
                          //             validate();
                          //           },
                          //           child: defaultButton('Login', Colors.green))),
                          // ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ForgetPassword()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Text("Forget Password ?",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Quicksand")),
                                  ),
                                )),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 70.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ));
                              },
                              child: Text("Create an Account ?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Quicksand")),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ));
            }
          
            void saveData(data) {
            Storage.saveUser(data).then((bool committed){
              Storage.getUser().then((value){
                 var arr =value.split(',');
                  var id = arr[0].split(':')[1].trim();
                  var phone =arr[1].split(':')[1].trim();
                  var firstName = arr[2].split(':')[1].trim();
                  var lastName = arr[3].split(':')[1].trim();
                  var email = arr[4].split(':')[1].trim();
                  var address = arr[5].split(':')[1].trim().split('}')[0];
                  final user = User(token: token, id: id, phone: phone, firstName: firstName,
                  lastName: lastName, email: email, address: address);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context)=> Index(user),
                    ));
              });
                  //  Navigator.push(context, MaterialPageRoute(
                  //     builder: (context)=> Index(user),
                  //   ));
              // });
              
      
            });
            
            }
}
