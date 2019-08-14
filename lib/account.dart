import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'utilities/general.dart';
import 'utilities/profileCard.dart';
import 'utilities/notification.dart';
import 'addAccount.dart';

class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _Account();
  }
}

class _Account extends State<Account> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      bottomNavigationBar: 
      Material(
        color: Colors.white,
        child:TabBar(
        controller: tabController,
        indicatorColor: Colors.green,
        tabs: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Dashboard()
                  ));
                } ,
                child:
             Tab(
                icon: Icon(Icons.home, color: Colors.grey),
              ),),
              Tab(
                icon: Icon(Icons.history, color: Colors.grey),
              ),
              Tab(
                icon: Icon(Icons.chat, color: Colors.grey),
              ),
               Tab(
                icon: Icon(Icons.person_outline, color: Colors.green),
              )
          ],
      ) ,
      ),
      body: Stack(
        children: <Widget>[
          whiteBackground(),
          ListView(
            children: <Widget>[
              ProfileCard(),
              SizedBox(height: 10.0,),
              Padding(padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: 
                notify(Icons.info, Colors.red[50], 'Provide your bank details to recieve your loan', Colors.red[300]),
              ),
              SizedBox(height: 10.0,),
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> AddAccount()
                      ));
                    },
                    child: Padding(
                    padding: EdgeInsets.only(left: 270.0, right: 20.0),
                    child:  customButton(30.0, '+ Bank Account', Colors.white, Colors.red[400], 14.0, FontWeight.bold, 'Quicksand'),
                  ),
                  ),
                  
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                   height: 70,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(7.0),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[100],
                         offset: Offset(1.0, 1.0),
                         blurRadius: 1.0,
                         spreadRadius: 1.0
                       )
                     ]
                   ),
                   child: Column(
                     children: <Widget>[
                       Padding(
                     padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                     child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text('First Bank',
                       style: TextStyle(
                         color: Colors.black54
                       ),),
                       Text('Prince Maduke', style: TextStyle(
                         color: Colors.black45,
                       ),)
                     ],
                   ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 20.0, right: 20.0),
                     child:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                     children: <Widget>[
                       Image( image: AssetImage('images/wallet.png',), height: 40.0, width: 40.0),
                       Text('38209803928', style: TextStyle(
                         fontSize: 25.0,
                         color: Colors.black87
                       ),),
                       SizedBox(width: 10.0,),
                     ],
                   )
                   )
                     ],
                   )
                 )
                  )
                 
                ],
              )
            ],
          )

        ],
      )
      
    );
  }
}