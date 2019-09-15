import 'package:flutter/material.dart';
import 'package:our_money_app/component/sendMessage.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';

class Notice extends StatefulWidget {
  final user;
  Notice(this.user);
  @override
  State<StatefulWidget> createState() {
    
    return _Notice(this.user);
  }
  
}


class _Notice extends State<Notice> with SingleTickerProviderStateMixin{
  final user;
  _Notice(this.user);

  TabController tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List chats = List();
  double _bodyHeight;
  bool open;
@override
  void initState() {
    fetchChat();
    super.initState();
  }

void fetchChat() async {
      var result = await ApiService.getData('chats/view', user.token);
      if(result.containsKey('data')){
        setState(() {
         chats = result['data'] as List;
         print(chats);
        });
        
      } 
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
          builder: (context)=> Message(user)
        ));
      }
    ),
      body: Stack(
        children: <Widget>[
          whiteBackground(),
          Container(
            height: 250.0,
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
                  height: 160.0,
                  child: Center(
                    child: Text(
                      "Inbox",
                      style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
                    ),
                  ),
                ),
                Positioned(
                  top: 100.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
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
                )  
                ])),
                Padding(padding: EdgeInsets.only(top: 210),
                  child: Container(
                  child:
                  
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index){
                      return Column(
                      children: <Widget>[
                        
                        SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

               Card(
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
                            child: 
                            
                            ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage('images/rep.png'),
                                ),
                                title:
                                 Padding(
                                   padding: const EdgeInsets.only(top:10.0),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(chats[index]['to'].toString()
                                      ),
                                      SizedBox(
                                        width: 50.0,
                                      ),
                                      Text(
                                        chats[index]['time'], style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                ),
                                 ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0,),
                                    Text('Subject: '+chats[index]['subject'].toString(), style: TextStyle(fontSize: 15),),
                                    SizedBox(height: 10,),

                                    Container(
                                      height:90,
                                      width: MediaQuery.of(context).size.width,
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
                                      child: 
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(chats[index]['message'].toString(), style: TextStyle(fontSize: 15),),
                                      )
                                      ),
                                   SizedBox(height: 5.0,)
                                  ],
                                ),
                                
                              ),
                          )
              ),
               
            ],
          ),
        ),
      ),
                        
                      ],
                    );

                    }
                  )

                ),
                ),
              
                


          
        ],
      )
    );
  }
}



