import 'package:flutter/material.dart';
import 'package:our_money_app/component/dashboard.dart';
import 'package:our_money_app/utilities/general.dart';
import 'package:our_money_app/services/api_service.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final _vPhone = new GlobalKey<FormState>();
  final _vOTP = new GlobalKey<FormState>();
  final _userForm = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isWorking =false;
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);

    void _goto(int val) {
      _pageController.animateToPage(val,
          duration: Duration(milliseconds: 500), curve: SawTooth(1));
    }

    final phoneForm = _vPhone.currentState;
    final otpForm = _vOTP.currentState;
    final userForm = _userForm.currentState;
    String _phone;
    String _otp;
    String _firstName;
    String _lastName;
    String _email;
    String _password;
    String _address;
    
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
  
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}
    
    //auth/verification auth/otp auth/signup

    validatePhone() async {
        if (phoneForm.validate()) {
          _isLoading();
        _vPhone.currentState.save();
        var result = await ApiService.postData({'phone': _phone}, 'auth/verification');
        print(result);
        if (result.containsKey('token')) {
          _goto(1);
        } else {
          _isNotLoading();
          showInSnackBar(result['error'].toString());
        }
      } else {
        print('form is invalid');
      }

    }

    validateOTP() async {
      if (otpForm.validate()) {
        _isLoading();
        _vOTP.currentState.save();
        print(_otp);
        var result = await ApiService.postData({'phone': '7064567799', 'code': _otp}, 'auth/otp');
        print(result);
         if (result['message'] == 'success') {
          _goto(2);
        } else {
          _isNotLoading();
          showInSnackBar(result['error'].toString());
        }
        
      } else {
        print('form is invalid');
      }
    }

     validateUser() async {
      if (userForm.validate()) {
        _isLoading();
        _userForm.currentState.save();
        final data = {
          'first_name': _firstName,
          'last_name': _lastName,
          'email': _email,
          'password': _password,
          'address': _address
        };
        print(data);
        var result = await ApiService.postDataWithToken(data, 'auth/signup', 'eyJhbGciOiJIUzI1NiJ9.NzA2NDU2Nzc5OQ.oCQGQhQZvMQjzcnyoAp_8adSupzfAp2Auddqi9awot4');
         if (result.containsKey('data')) {
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context)=> Dashboard(user)
          // ));
        } else {
          _isNotLoading();
          showInSnackBar(result['error'].toString());
        }
      } else {
        print('form is invalid');
      }
    }

    List<Widget> _pages(context) {
      return <Widget>[
        // ----- Enter phone number for registeration ---- ////
        Container(
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
                    child: Text("Enter your phone number",
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
                      visible:_isWorking,
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
                              child: defaultButton('Continue', Colors.green)),
                        ),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ////---------- Enter OTP for verification ------------////

        // ListView(
        //   physics: BouncingScrollPhysics(),
        //   children: <Widget>[
        Container(
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
                        top: 70.0, left: 15.0, right: 5.0),
                    child: Text("Phone number verification",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Saira Stencil One")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15.0, right: 5.0),
                    child: Text("Enter the six digit pin sent to +234$_phone",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto")),
                  ),
                ],
              ),
              Form(
                key: _vOTP,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Code OPT",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "Quicksand"),
                            fillColor: Colors.white,
                            hintText: '- - - - - -',
                            hintStyle: TextStyle(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          validator: (value) => value.isEmpty
                              ? 'OTP field can\'t be empty'
                              : null,
                          onSaved: (value) => _otp = value,
                          keyboardType: TextInputType.number,
                          style: new TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        maxLength: 6,
                        )
                        
                        ),
                    Text(
                      'Resend Code ?',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Visibility(
                      visible:_isWorking,
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
                            validateOTP();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: defaultButton('Continue', Colors.green)),
                        ),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        )
        //   ],
        // )
        ,

        Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                greenBackground(),
                ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 20.0, right: 20.0),
                          child: Text("Let setup your account",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Saira Stencil One")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: Text("Please provide the following details",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto")),
                        )
                      ],
                    ),
                    Form(
                        key: _userForm,
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 40.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'First name can\'t be empty'
                                          : null,
                                      onSaved: (value) => _firstName = value,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'Last name can\'t be empty'
                                          : null,
                                      onSaved: (value) => _lastName = value,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "Email Address",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'Email address can\'t be empty'
                                          : null,
                                      onSaved: (value) => _email = value,
                                      keyboardType: TextInputType.emailAddress,
                                      style: new TextStyle(
                                          height: 0.3,
                                          fontFamily: "Poppins",
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty &&
                                              value.length < 6
                                          ? 'Password number can\'t be empty and must more than 6 characters'
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 20.0, right: 20.0),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "Address",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                        ),
                                      ),
                                      validator: (value) => value.isEmpty
                                          ? 'Address can\'t be empty'
                                          : null,
                                      onSaved: (value) => _address = value,
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
                        )
                        ),
                        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Visibility(
                      visible:_isWorking,
                      child: Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),

                      replacement: Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: 40.0, left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            validateUser();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height:50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: defaultButton('Save', Colors.green)),
                        ),
                      )),
                    ),
                  )
                ],
              )
                   
                  ],
                )
              ],
            ))
      ];
    }

    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        children: _pages(context),
        onPageChanged: (val) {},
        controller: _pageController,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
