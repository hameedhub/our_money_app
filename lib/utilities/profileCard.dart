import 'package:flutter/material.dart';
import '../account.dart';
import '../myCards.dart';


class ProfileCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Column(
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
                color: Colors.black54,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 2.0,),
              Text('Benin City, Nigeria', style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45
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
                                    blurRadius: 1.0,
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
                    GestureDetector(
                      child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(height: 5.0,),
                        Icon(Icons.credit_card, color: Colors.yellow[700], size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("My Card", style: TextStyle(
                          color: Colors.grey,
                          fontSize:13.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quicksand",
                        ))
                      ],
                    ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyCards()
                        ));
                      },
                    ),
                    GestureDetector(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Icon(Icons.local_atm, color: Colors.red, size: 23.0,),
                        SizedBox(height: 2.0,),
                        Text("Account details", style: TextStyle(
                          color: Colors.grey,
                          fontSize:14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quicksand",
                        ))
                      ],
                    ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Account()
                        ));
                      },
                    ),
                    
                    SizedBox(width:1.0)
                  ],
                ),
                ],),
              )
            ],
          ) ;
  }
}