

import 'package:flutter/material.dart';
import 'package:our_money_app/component/addAccount.dart';
import 'package:our_money_app/component/addCard.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';
import 'package:our_money_app/utilities/notification.dart';

class Profile extends StatefulWidget{
  final user;
  Profile(this.user);
  @override
  State<StatefulWidget> createState() {
    return _Profile(this.user);
  }
}

class _Profile extends State<Profile>{
  final user;
  _Profile(this.user);


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget pageContent;
  List list = List();
  List list2 = List();
  bool show = true;
   bool isLoading = true;

  @override
  void initState() {
   pageContent = profile(user);
   fetchAccount();
   fetchCard();

    super.initState();
  }

  
   fetchCard() async {
    final result = await ApiService.getData('cards', user.token);
    if (result.containsKey('data')) {
      setState(() {
        list = result['data'] as List;
        if(list.length > 0 ){
           isLoading =false;
         }else{
           show = false;
         }
      });
    }else{
    setState((){
      show = false;
    });
    }
  }
    fetchAccount() async {
    final result = await ApiService.getData('accounts/view', user.token);
    print(result);
    if (result.containsKey('data')) {
      setState(() {
        list2 = result['data'] as List;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key:_scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          
              Container(
               height: 250,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[500],
                    gradient: LinearGradient(
              colors: [Colors.green[800],Colors.green[700], Colors.green[800],Colors.green[700],Colors.green[500], Colors.green[800], Colors.green[700],Colors.green[800]],
              begin: Alignment.centerRight,
              end: Alignment.bottomCenter)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                tag: 'images/avatar.png',
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(1.0, 8.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                    borderRadius: BorderRadius.circular(40.0),
                      image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('images/profile1.jpeg')
                    )
                  ),
                ),
              ),
               SizedBox(height: 10.0,),
              Text(user.firstName+' '+user.lastName, style:TextStyle(
                color: Colors.white,
                fontFamily: "Quicksand",
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 5.0,)
                      ],
                    )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 175.0,),
                  child: Container(
                    height: 75,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: Colors.green.withOpacity(0.6), width: 2.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          SizedBox(width: 10.0,),
                          Expanded(
                            child:
                            Column(
                              children: <Widget>[
                                IconButton(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                               pageContent = profile(user);
                             });
                            },
                          ),
                          Text('Profile Details', style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          //fontSize:13.0,
                          fontFamily: "Quicksand",
                        ),),
                          SizedBox(height: 5.0,)
                              ],
                            ) 
                          ),
                          Text('➡', style: TextStyle(fontSize: 20, color: Colors.green[200]),),
                           Expanded(
                            child:
                            Column(
                              children: <Widget>[
                                IconButton(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.yellow[900],
                            ),
                            onPressed: () {
                              fetchCard();
                             setState(() {
                               pageContent = myCard(context, user, isLoading, list, show);
                             });
                            },
                          ),
                          Text('My Card', style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quicksand",
                        ),),
                          SizedBox(height: 5.0,)
                              ],
                            ) 
                          ),
                          Text('➡', style: TextStyle(fontSize: 20, color: Colors.green[200]),),
                           Expanded(
                            child:
                            Column(
                              children: <Widget>[
                                IconButton(
                            icon: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                             setState(() {
                               fetchAccount();
                               pageContent = account(context, user, isLoading, list2, show);
                             });
                            },
                          ),
                          Text('Account Details', style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          //fontSize:13.0,
                          fontFamily: "Quicksand",
                        ),),
                          SizedBox(height: 5.0,)
                              ],
                            ) 
                          ),
                          SizedBox(width: 10.0,)
                        ]
                      ),
                    ),
                  ),
                ),
                  
                ])
                ), 

                Padding(
                  padding: EdgeInsets.only(top:250),
                  child: pageContent,
                )     
          
        ]
      ),

      
    );
  }
}

Widget profile (user){
return Container(
            padding: EdgeInsets.only(top: 10),
             child:
            ListView(
              children: <Widget>[
                 Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: user.firstName+' '+user.lastName,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Full Name",
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
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: "234"+user.phone,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
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
                      keyboardType: TextInputType.phone,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ],
              ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: user.email,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Email Address",
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
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: user.address,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "Address",
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
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    )
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50.0,
                  //     decoration: BoxDecoration(
                  //       color: Colors.green[400],
                  //       border: Border.all(
                  //         color: Colors.green,
                  //         width: 1.0
                  //       ),
                  //       borderRadius: BorderRadius.circular(7.0)
                  //     ),
                  //     child: Text("Update", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),)
                  //   ),
                  // )
                ],
              ),
              ],
            )
             
            
          );
}

Widget myCard (BuildContext context, user, isLoading, list, show){
    return 
    Container(
              padding: EdgeInsets.only(top: 20),
               child:
       Column(
                children: <Widget>[
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
                       padding: EdgeInsets.only(left: 20.0, right: 20.0),
                           child:notify(Icons.info, Colors.red[50], 'Here are bank card you have linked to your account', Colors.red[300]),
                     )
                ),
              ),
              SizedBox(
                height: 10,
              ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> AddCard(user)
                      ));
                    },
                    child:Padding(
                    padding: EdgeInsets.only(left: 300, right: 15.0, bottom: 5),
                    child: Container(
                      alignment: Alignment.center,
                    height: 22.0,
                    width: 100.0,
                    decoration: BoxDecoration(color:Colors.red[400],
                    borderRadius: BorderRadius.circular(10.0),
                   boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[100],
                         offset: Offset(1.0, 2.0),
                         blurRadius: 1.0,
                         spreadRadius: 1.0
                       )
                     ]
                   ),
                    child: customButton(30.0, '+ Add Card', Colors.white, Colors.red[400], 14.0, FontWeight.bold, 'Quicksand'),
                  ),
                  ),),
                  
          
                  SizedBox(height: 10.0,),


                 show ? Visibility(
                     visible: isLoading,
                     child:
                     Padding(
                       padding: EdgeInsets.only(top: 50),
                       child: Center(
                        child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.green,
                                    ),
                      ),
                     ),
                      
                      replacement:
                 
                 ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index){
                      return 
                      Padding(
                        padding: EdgeInsets.only(right: 20, left:20, bottom: 10),
                        child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.0),
                       boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[100],
                         offset: Offset(1.0, 2.0),
                         blurRadius: 1.0,
                         spreadRadius: 1.0
                       )
                     ]
                   ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                Text(list[index]['card_name'], style: TextStyle(fontFamily: 'Quicksand', fontSize: 12.0,),),
                                Icon(Icons.lock, color: Colors.red[400], size: 15.0,)
                            ],
                          ) 
                           ),
                        Row(
                          children: <Widget>[
                            Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Icon(Icons.credit_card, size: 50.0, color: Colors.yellow[800],)
                        ),
                        SizedBox(width: 30.0,),
                        Padding( padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
                        child: Text(list[index]['card_number'], style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),),
                        ),
                          ],
                        ),
                        
                      ],
                    ),
                    
                    )
                      );
                    }
                  )):
                  Image(
                          height: MediaQuery.of(context).size.height/3,
                         image: AssetImage('images/no_results_found.png'),
                        
                       )

                ],
              )
  );
            
}




Widget account(BuildContext context, user, isLoading, list, show){
  print(list);
  return Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: notify(Icons.info, Colors.red[50], 'Provide your bank details to recieve your loan', Colors.red[300]),
                  ),
                  
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> AddAccount(user)
                      ));
                    },
                    child: Padding(
                    padding: EdgeInsets.only(left: 270.0, right: 20.0),
                    child:  customButton(30.0, '+ Bank Account', Colors.white, Colors.red[400], 14.0, FontWeight.bold, 'Quicksand'),
                  ),
                  ),
                  
                  SizedBox(height: 10.0,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index){
                      return Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
                    child: 
                    Container(
                   height: 80,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(7.0),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                         color: Colors.green[100],
                         offset: Offset(1.0, 2.0),
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
                       Text(list[index]['bank_name'],
                       style: TextStyle(
                         color: Colors.black54
                       ),),
                       Text(list[index]['account_name'], style: TextStyle(
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
                       Icon(Icons.account_balance_wallet, size: 50.0, color: Colors.red[800],),
                       Text(list[index]['account_number'], style: TextStyle(
                         letterSpacing: 2.0,
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
                  ); }),
                  
                 
                ],
              );
                
}