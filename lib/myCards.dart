import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'profile.dart';
import 'addCard.dart';

class MyCards extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _MyCards();
  }
}

class _MyCards extends State<MyCards> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
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
        )
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Hero(
                tag: 'images/avatar.png',
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/avatar.png')
                    )
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              Text('Prince Maduke', style:TextStyle(
                fontFamily: "Quicksand",
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 2.0,),
              Text('Benin City, Nigeria', style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10.0, top: 30.0, right: 10.0),
                child:Stack(children: <Widget>[
                  Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 100.0,
                                    spreadRadius: 10.0,
                                  ),
                                ],
                      color: Colors.white
                    ),
                  ),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 1.0,),
                    GestureDetector(
                      child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(height: 5.0,),
                        Icon(Icons.portrait, color: Colors.green, size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("Profile Details", style: TextStyle(
                          color: Colors.grey,
                          fontSize:13.0,
                          fontFamily: "Quicksand",
                        ))
                      ],
                    ),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Profile(),
                          
                        ));
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(height: 5.0,),
                        Icon(Icons.credit_card, color: Colors.yellow[700], size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("My Card", style: TextStyle(
                          color: Colors.grey,
                          fontSize:13.0,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Icon(Icons.tablet, color: Colors.red, size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("Account details", style: TextStyle(
                          color: Colors.grey,
                          fontSize:14.0,
                          fontFamily: "Quicksand",
                        ))
                      ],
                    ),
                    SizedBox(width:1.0),
                  ],
                ),
                ],),
              ),
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
                         children: <Widget>[
                          Icon(Icons.info_outline, color: Colors.red[200],),
                          Text(' Here are the bank cards you have linked to your Our Money account', 
                          style: TextStyle(color: Colors.red[300],
                          fontSize: 11.0,
                          ),)
                         ],
                       )
                     )
                ),
              ),
              SizedBox(height: 10.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> AddCard()
                      ));
                    },
                    child:Padding(
                    padding: EdgeInsets.only(left: 300, right: 15.0),
                    child: Container(
                      alignment: Alignment.center,
                    height: 22.0,
                    width: 100.0,
                    decoration: BoxDecoration(color:Colors.red[400],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.red,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                    ),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white),
                        Text('Add Card', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          ))
                      ],
                    ),
                  ),
                  ),),
                  
                SizedBox(height: 10.0,),
                Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.0),
                       boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
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
                                Text('Prince Maduka', style: TextStyle(fontFamily: 'Quicksand', fontSize: 12.0,),),
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
                        Padding( padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                        child: Text('593***** **** *132', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),),
                        ),
                          ],
                        )
                        
                      ],
                    ),
                    
                    )
                ,),
                  SizedBox(height: 10.0,),
                Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.0),
                       boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
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
                                Text('Prince Maduka', style: TextStyle(fontFamily: 'Quicksand', fontSize: 12.0,),),
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
                        Padding( padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                        child: Text('352***** **** *269', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),),
                        ),
                          ],
                        )
                        
                      ],
                    ),
                    
                    )
                ,)
                ],
              )
            ],
          ),
        ],
      ) ,
    );
  }
}