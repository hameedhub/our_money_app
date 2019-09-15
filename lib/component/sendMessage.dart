import 'package:flutter/material.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';

class Message extends StatefulWidget{
  final user;
  Message(this.user);
  @override
  State<StatefulWidget> createState() {
    
    return _Message(this.user);
  }
}

class _Message extends State<Message>{
  final user;
  _Message(this.user);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _messageForm = new GlobalKey<FormState>();
  bool _isWorking = false;

String _subject;
String _message;


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
   final form = _messageForm.currentState;
        if (form.validate()) {
          _isLoading();
       _messageForm.currentState.save();
        var result = await ApiService.postDataWithToken({"subject":_subject ,"message":_message, "to":'Customer Care'}, 'chats/send', user.token);
        if (result.containsKey('data')) {
         successSnackBar(result['message'].toString());
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
        titleSpacing: 100,
        title: Text('Message', style: TextStyle(color: Colors.white,)),
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
               child:  Text("Enter your message", style: TextStyle(color: Colors.green, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
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
           Padding(
             padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
             child:
             Form(
               key: _messageForm,
               child: Column(
               children: <Widget>[
                TextFormField(
                      initialValue: ' ',
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Subject",
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
                     validator: (value) => value.length < 3
                                          ? 'Subject can\'t be empty'
                                          : null,
                                      onSaved: (value) => _subject = value,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      maxLength: 30,
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      initialValue: ' ',
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: " Your Message",
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
                     validator: (value) => value.length < 5
                                          ? 'Message can\'t be empty'
                                          : null,
                                      onSaved: (value) => _message = value,
                      keyboardType: TextInputType.text,
                      maxLines: 7,
                      style: new TextStyle(
                        height: 1,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      
                      maxLength: 150,
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
                                        child: successButton('Send', Colors.white),)
                                  ),
                                )
                              ),
                            ),

               ],
             ),
             )
              
           ),
           SizedBox(height: 20.0,),
          
          ],
        )
        ],
      )
      
    );
  }
}