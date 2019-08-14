import 'package:flutter/material.dart';
import 'package:our_money_app/utilities/notification.dart';
import 'utilities/general.dart';

class AddAccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _AddAccount();
  }

}

class _AddAccount extends State<AddAccount>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
           Padding(
             padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
             child: Column(
               children: <Widget>[
                 inputForm('Prince Maduke', 'Account Name', TextInputType.text),
                 SizedBox(height: 20.0,),
                 inputForm('Enter your bank name', 'Bank Name', TextInputType.text),
                 SizedBox(height: 20.0,),
                 inputForm('000 0000 000', 'Account Number', TextInputType.number),
                 SizedBox(height: 20.0,),
                 successButton('Save', Colors.white)
               ],
             ),
           ),
           SizedBox(height: 20.0,),
           Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: notify(Icons.notification_important, Colors.red[50], 'Please provide correct account details for loan payment', Colors.red[300])
            ),
          ],
        )
        ],
      )
      
    );
  }
}