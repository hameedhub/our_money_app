import 'package:flutter/material.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';
import 'package:our_money_app/utilities/notification.dart';

class AddAccount extends StatefulWidget{
  final user;
  AddAccount(this.user);
  @override
  State<StatefulWidget> createState() {
    
    return _AddAccount(this.user);
  }

}

class _AddAccount extends State<AddAccount>{
  final user;
  _AddAccount(this.user);

  final _accountForm = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();    
  bool _isWorking = false;
  String _name;
  String _num;
  String _bank;

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

validateInput() async {
   final form = _accountForm.currentState;
        if (form.validate()) {
          _isLoading();
       _accountForm.currentState.save();
       print(_name);
        var result = await ApiService.postDataWithToken({"account_name":_name ,"bank_name":_bank, "account_number":_num}, 'accounts/create', user.token);
        if (result.containsKey('data')) {
         successSnackBar('Account was successfully added');
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
               child:  Text("Enter your Account detials", style: TextStyle(color: Colors.green, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
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
             SizedBox(height: 20.0,),
           Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: notify(Icons.notification_important, Colors.red[50], 'Please provide correct account details for loan payment', Colors.red[300])
            ),
           Padding(
             padding: EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
             child:
             Form(key: _accountForm,
              child: Column(
               children: <Widget>[
                   TextFormField(
                      initialValue: user.firstName+' '+user.lastName,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Account Name",
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
                                          ? 'Account name can\'t be empty'
                                          : null,
                                      onSaved: (value) => _name = value,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 20,
                    ),
                 SizedBox(height: 20.0,),
                 TextFormField(
                      initialValue: " ",
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Bank Name",
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
                     validator: (value) => value.length < 2
                                          ? 'Bank name can\'t be empty'
                                          : null,
                                      onSaved: (value) => _bank = value,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 30,
                    ),
                 SizedBox(height: 20.0,),
                 TextFormField(
                      initialValue: '',
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Account Number",
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
                     validator: (value) => value.length < 2
                                          ? 'Account number can\'t be empty'
                                          : null,
                                      onSaved: (value) => _num = value.trim(),
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 10,
                    ),
                 SizedBox(height: 20.0,),

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
                                      validateInput();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height:50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        child: successButton('Save Account', Colors.white),)
                                  ),
                                )
                              ),
                            ),

               ],
             ),
             ) 
           ),
          
          ],
        )
        ],
      )
      
    );
  }
}