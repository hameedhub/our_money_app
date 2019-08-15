import 'package:flutter/material.dart';
import 'package:our_money_app/utilities/general.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register>{

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    
    void _goto(int val) {
      _pageController.animateToPage(val,
          duration: Duration(milliseconds: 500), curve: SawTooth(1));
    }

  TextEditingController _phoneNumber = TextEditingController(text: '');
  TextEditingController _otpCode = TextEditingController();



  List<Widget>_pages(context){
    return <Widget>[
      // ----- Enter phone number for registeration ---- ////
    Container(
      height:MediaQuery.of(context).size.height,
      child:Stack(
            fit:  StackFit.expand,
            children: <Widget>[
              greenBackground(),
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
                      controller: _phoneNumber,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Enter Phone Number",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 15.0, fontFamily: "Quicksand"),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
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
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
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
                      _goto(1);
                    },

                    child:  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: defaultButton('Continue', Colors.green)
                  ),
                  ) ,
                  )
                )
              ],)
            ],
          ) ,
    ),
  ////---------- Enter OTP for verification ------------////
  
  ListView(
    physics: BouncingScrollPhysics(),
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            greenBackground(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 70.0, left: 15.0, right: 5.0),
                  child: Text("Phone number verification", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: "Saira Stencil One")),
                  ),
                  Padding(padding: const EdgeInsets.only(top:10.0, left: 15.0, right: 5.0),
                  child: Text("Enter the six digit pin sent to +234${_phoneNumber.text}", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Roboto")),
                  )
                ],
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _phoneNumber,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Code OPT",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 15.0, fontFamily: "Quicksand"),
                        fillColor: Colors.white,
                        hintText: '- - - - - -',
                        hintStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      style: new TextStyle(
                        fontFamily: "Poppins", color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Text('Resend Code ?', style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              ),
              
            


          ],
        ),
      )
    ],
  )
  


    ];
  }
    return Scaffold(
      body: PageView(
        children: _pages(context),
        onPageChanged: (val){},
        controller: _pageController,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}