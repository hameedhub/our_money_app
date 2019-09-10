import 'package:flutter/material.dart';
import 'package:our_money_app/component/sendMessage.dart';
import 'package:our_money_app/utilities/general.dart';

class Notice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _Notice();
  }
  
}


class _Notice extends State<Notice> with SingleTickerProviderStateMixin{
  TabController tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 @override
  void initState() {
    super.initState();
    tabController = TabController(length:4, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      child: new Icon(Icons.chat_bubble, color: Colors.white,),
      backgroundColor: Colors.green[400],
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> Message()
        ));
      }
    ),
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
                      "Inbox",
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
                        SizedBox(height: 30.0,),
                        Padding(padding: EdgeInsets.only(left: 10.0, right: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[300],
                         offset: Offset(1.0, 1.0),
                         blurRadius: 1.0,
                         spreadRadius: 1.0
                       )
                     ]
                          ),
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('images/profile.jpg'),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Admin'),
                                  SizedBox(
                                    width: 50.0,
                                  ),
                                  Text(
                                    '8:50am',
                                  ),
                                ],
                              ),
                              subtitle: Text('This is a message to you'),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                        )
                        ),
                        
                         Padding(padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[300],
                         offset: Offset(1.0, 1.0),
                         blurRadius: 1.0,
                         spreadRadius: 1.0
                       )
                     ]
                          ),
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('images/profile.jpg'),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Admin'),
                                  SizedBox(
                                    width: 50.0,
                                  ),
                                  Text(
                                    '8:50am',
                                  ),
                                ],
                              ),
                              subtitle: Text('This is a message to you'),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                        )
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



