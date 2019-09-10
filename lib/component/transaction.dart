import 'package:flutter/material.dart';
//import 'package:our_money_app/nofication/sendMessage.dart';
import 'package:our_money_app/utilities/general.dart';


class Transaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _Transaction();
  }
  
}


class _Transaction extends State<Transaction> with SingleTickerProviderStateMixin{
  TabController tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          whiteBackground(),
          Container(
            height: 150.0,
            child: Stack(
              children: <Widget>[
                Container(
                 decoration: BoxDecoration(
                    color: Colors.green[500],
                    gradient: LinearGradient(
              colors: [Colors.green[700],Colors.green[700], Colors.green[800],Colors.green[700],Colors.green[500], Colors.green[800], Colors.green[700]],
              begin: Alignment.centerRight,
              end: Alignment.bottomCenter)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Transaction",
                      style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              print("your menu action here");
                              _scaffoldKey.currentState.openDrawer();
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search", hintStyle: TextStyle(color: Colors.green),
                              ),
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                )  
                ])),
                Padding(padding: EdgeInsets.only(top: 120),
                  child: Container(
                  child:
                ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 10.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 20.0,
                                  ),
                                ],
                              image: DecorationImage(
                                image: AssetImage('images/ads.jpeg'),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                        ),
                       
                       
                        
                      ],
                    )
                  ],
                )
                ),
                )
                


          
        ],
      )
    );
  }
}



