import 'package:flutter/material.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';

class AddCard extends StatefulWidget{
  final user;
  AddCard(this.user);
  @override
  State<StatefulWidget> createState() {
    return _AddCard(this.user);
  }
}

class _AddCard extends State<AddCard>{
  final user;
  _AddCard(this.user);
  final _cardForm = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();    
  bool _isWorking = false;
  String _name;
  String _date;
  String _cvv;
  String _num;
  

   void errorSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}
void successSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.green[400]
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

 validateCard() async {
   final form = _cardForm.currentState;
        if (form.validate()) {
          _isLoading();
       _cardForm.currentState.save();
       print(_name);
        var result = await ApiService.postDataWithToken({"card_name":_name ,"card_number":_num, "card_date": _date,"cvv":_cvv}, 'cards/add', user.token);
        if (result.containsKey('data')) {
         successSnackBar('Card was successfully added');
         _isNotLoading();
        } else {
          _isNotLoading();
          errorSnackBar(result['error'].toString());
        }
      } else {
        print('form is invalid');
      }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          Text('Your card details are been encrypted', 
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
                  Form(
              key: _cardForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: user.firstName+' '+user.lastName,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Card Holder Name",
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
                     validator: (value) => value.isEmpty
                                          ? 'Card name can\'t be empty'
                                          : null,
                                      onSaved: (value) => _name = value,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 30,
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextFormField(
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
                     validator: (value) => value.length != 15
                                          ? 'Card number should be 15 digits'
                                          : null,
                                      onSaved: (value) => _num = value,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 15,
                    )
                  ),
                  Row(
                    children: <Widget>[
                     Expanded(
                       child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
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
                      validator: (value) => value.length != 5
                                          ? 'e.g 06/20'
                                          : null,
                                      onSaved: (value) => _date = value,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 5,
                    )
                  ),
                     ),
                     Expanded(
                       child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
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
                      validator: (value) => value.length != 3
                                          ? 'e.g 123'
                                          : null,
                                      onSaved: (value) => _cvv = value,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 3,
                    )
                  ),
                     ),
                    ],
                  )
                ],
              ),
                
            ),
            Container(
                              child: Visibility(
                                visible:_isWorking,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
          
                                replacement:  Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 20, right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      validateCard();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height:50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        child: successButton('Save Card', Colors.white),)
                                  ),
                                )
                              ),
                            ),
                  
                  
                    
                ],
              ),

      ],
    ),   
    );
  }
}