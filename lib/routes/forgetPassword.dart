import 'package:flutter/material.dart';
import 'package:our_money_app/utilities/general.dart';


class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPassword();
  }
}

class _ForgetPassword extends State<ForgetPassword> {
 
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _vPhone = new GlobalKey<FormState>();

  bool _isWorking = false;
  String _phone;
  
  
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}

     validatePhone() async {
        showInSnackBar('Service error, please try again later');

    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body:         Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              greenBackground(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70.0, left: 20.0, right: 20.0),
                    child: Text("Forgot Password ?",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Saira Stencil One")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    child: Text(
                        "We'll send an SMS with a code to verify your phone number",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto")),
                  )
                ],
              ),
              Form(
                key: _vPhone,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            prefixText: '+234',
                            labelText: "Enter Phone Number",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "Quicksand"),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          validator: (value) => value.isEmpty
                              ? 'Phone number can\'t be empty'
                              : null,
                          onSaved: (value) => _phone = value,
                          keyboardType: TextInputType.phone,
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                          maxLength: 10,
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Visibility(
                      visible:false,
                      child: Padding(
                        padding: EdgeInsets.only(top: 500.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),

                      replacement: Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: 500.0, left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            validatePhone();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: defaultButton('Reset Password', Colors.green)),
                        ),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }

}