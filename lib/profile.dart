import 'package:flutter/material.dart';
import 'dashboard.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _Profile();
  }
}
class _Profile extends State<Profile> with SingleTickerProviderStateMixin{
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
        child:  TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
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
                icon: Icon(Icons.inbox, color: Colors.grey),
              ),
               Tab(
                icon: Icon(Icons.person_outline, color: Colors.green),
              )
          ],
        ),
      ) ,
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Hero(
                tag: 'images/avatar.png',
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
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
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 500.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                      color: Colors.white
                    ),
                  ),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 1.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(height: 5.0,),
                        Icon(Icons.portrait, color: Colors.green, size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("Profile Details", style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize:13.0,
                          fontFamily: "Quicksand",
                        ))
                      ],
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
                        ))
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
                    SizedBox(width:1.0)
                  ],
                ),
                ],),
              )
            ],
          ),
          SizedBox(height: 10.0,),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
               child: Container(
                height: 250.0, 
                
              )
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      initialValue: "Prince Maduka",
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
                      initialValue: "234809808009",
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
                      initialValue: "prince@yahoo.com",
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
                      initialValue: "Benin City, Edo State.",
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

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        border: Border.all(
                          color: Colors.green,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(7.0)
                      ),
                      child: Text("Update", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),)
                    ),
                  )
                ],
              ),
              
             
              
            ],
          )
        ],
      )
    );
  }
}