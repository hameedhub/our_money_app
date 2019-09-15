import 'package:flutter/material.dart';
import 'package:our_money_app/services/api_service.dart';
//import 'package:our_money_app/nofication/sendMessage.dart';
import 'package:our_money_app/utilities/general.dart';


class Transaction extends StatefulWidget {
  final user;
  Transaction(this.user);

  State<StatefulWidget> createState() {
    return _Transaction(this.user);
  }
  
}


class _Transaction extends State<Transaction> with SingleTickerProviderStateMixin{
  final user;
  _Transaction(this.user);
  TabController tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool show =true;
  bool isWorking =true;
  List trans = List();
@override
  void initState() {
    fetchTrans();
    super.initState();
  }

void fetchTrans() async {
      var result = await ApiService.getData('request/view', user.token);
      if(result.containsKey('data')){
        setState(() {

         trans = result['data'] as List;
         //print(trans);
         if(trans.length > 0){
           isWorking =false;
         }else{
           show = false;
         }
        });
        
      } else{
        setState((){
          isWorking = false;
          show = false;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Transaction",
                      style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
                    ),
                  ),
                ),
                Positioned(
                  top: 100.0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
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
                )  
                ])),
                Padding(padding: EdgeInsets.only(top: 220),
                  child: Container(
                  child:

                   show  ?  
                   
                   Visibility(
                     visible: isWorking,
                     child:
                      Center(
                        child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.green,
                                    ),
                      ),
                      replacement:
                  
                   
                   
                   ListView.builder(
                    shrinkWrap: true,
                    itemCount: trans.length,
                    itemBuilder: (context, index){
                      return
                       Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10,),
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
                                backgroundImage: AssetImage('images/loan.png'),
                              ),
                              title: Column(
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  
                                  Text(trans[index]['_id'], style: TextStyle(fontSize: 13),),
                                  SizedBox(
                                    width: 20.0
                                  ),
                                  Text(
                                    trans[index]['request_time'].toString(), style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                                ],
                              ),
                             
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                   Icon(Icons.keyboard_arrow_down, color: Colors.green[500],),
                                   Text('₦'+trans[index]['amount'].toString(), style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold)),
                                   Text('➡', style: TextStyle(fontSize: 20, color: Colors.green[200]),),
                                   Text(trans[index]['loan_status'])
                                  ],),
                                  SizedBox(height: 2,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: <Widget>[
                                   Icon(Icons.keyboard_arrow_right, color: Colors.red[500],),
                                   Text('₦'+trans[index]['payback'].toString(), style: TextStyle(color: Colors.red[400])),
                                   Text('-'),
                                    Text(' ₦'+trans[index]['paid'].toString(), style: TextStyle(color: Colors.yellow[900])),
                                    Text('➡', style: TextStyle(fontSize: 15, color: Colors.green[200]),),
                                     Text(trans[index]['payback_status'])
                                  ],),
                                  SizedBox(height: 5,)
                                ],
                              ),
                              // trailing: Icon(
                              //   Icons.arrow_drop_down, color: Colors.red[400],
                              // ),
                            ),
                        )
                        );
                
                      
                       })): Image(
                         height: MediaQuery.of(context).size.height,
                         image: AssetImage('images/no_results_found.png'),
                       )
                      
                         )
                      
                )
                


          
        ],
      )
    );
  }
}



