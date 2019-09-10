import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Background
Widget greenBackground(){
 return Container(
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          gradient: LinearGradient(
              colors: [Colors.green[700],Colors.green[700], Colors.green[800],Colors.green[700],Colors.green[500], Colors.green[700]],
              begin: Alignment.centerRight,
              end: Alignment.bottomCenter)),
    );
}

Widget whiteBackground(){
  return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200]
    //       gradient: LinearGradient(
    //           //colors: [Colors.lightGreen[100], Colors.white24, Colors.lightGreen[100]],
    //           begin: Alignment.centerRight,
    //           end: Alignment.bottomCenter)),
    // 
    )
  );
}

// Input form
Widget inputForm(String initalValue, String labelText, TextInputType inputType  ){
  return TextFormField(
                      initialValue: initalValue,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: labelText,
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
                      keyboardType: inputType,
                      style: new TextStyle(
                        height: 0.3,
                        fontFamily: "Poppins", color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                    );
}

// default
Widget defaultButton(String text, Color textColor) {
  return Container(
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.white,
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand")),
  );
}

// danger
Widget dangerButton(String text, Color textColor) {
  return Container(
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.red[400],
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand")),
  );
}
// success
Widget successButton(String text, Color textColor) {
  return Container(
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.green[400],
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand")),
  );
}
// warning
Widget warningButton(String text, Color textColor) {
  return Container(
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.yellow[400],
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand")),
  );
}
// info
Widget infoButton(String text, Color textColor) {
  return Container(
    alignment: Alignment.center,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: Colors.blue[400],
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand")),
  );
}
// custom
Widget customButton(double size, String text, Color textColor, Color color, double fontSize, FontWeight fontWeight, String fontFamily ) {
  return Container(
    alignment: Alignment.center,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: color,
    ),
    child: Text(text,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily)),
  );
}