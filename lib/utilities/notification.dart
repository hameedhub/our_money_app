import 'package:flutter/material.dart';

Widget notify( IconData icon, Color bgColor, String text, Color textColor){
  return Container(
    alignment: Alignment.center,
    height: 30.0,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.0)
    ),
    child:  Row(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: <Widget>[
          Icon(icon, size: 14.0, color: textColor,),
          SizedBox(width: 10.0,),
          Text(text, style: TextStyle(color: textColor, fontSize: 14.0,),),
      ],
    ),
  
  );
}