import 'package:flutter/material.dart';
import 'package:our_money_app/routes/login.dart';
//import 'enterPhone.dart';

class Welcome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _Welcome();
  }
}
class _Welcome extends State<Welcome>{
  int photoIndex = 0;
  List<String> photos = [
    'images/welcome.jpeg',
    'images/ads.jpeg'
  ];
  void _previousImage (){
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }
  void _nextImage (){
    setState(() {
      photoIndex = photoIndex <  photos.length -1  ? photoIndex + 1 : photoIndex; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     body: Stack(
            fit:  StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  gradient: LinearGradient(
                    colors:[ Colors.green[600], Colors.limeAccent[100]],
                    begin: Alignment.centerRight,
                    end: Alignment(-1.0, -1.0)
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 30.0,
                    child: Image.asset('images/logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('our ', style: TextStyle(color: Colors.lightGreen[800], fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One",), ),
                        Text('m', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0,fontFamily: "Saira Stencil One"), ),
                         Text('o', style: TextStyle(color: Colors.yellowAccent[700], fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), ),
                          Text('ney', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: "Saira Stencil One"), )
                      ],
                    ),
                  )  
                ],
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 160.0, left: 15.0, right: 15.0) ,
                child:Container(
                child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 10.0,
                              blurRadius: 100.0
                            )
                          ],
                          image:  DecorationImage(
                            image:  AssetImage(photos[photoIndex]),
                            fit: BoxFit.fill
                          )
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent
                        ),
                        onTap: _nextImage,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.transparent
                        ),
                        onTap: _previousImage,
                      ),
                      Positioned(
                        top: 320,
                        left: MediaQuery.of(context).size.width/2 - 30.0 ,
                        child: Row(children: <Widget>[
                          SelectedPhoto(
                            numberOfDots: photos.length,
                            photoIndex: photoIndex,
                          )
                        ],),
                      )
                    ],
                  )
                ],
              ),
              ),
              ),
              
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 500.0, left: 20.0, right: 20.0),
                    child: GestureDetector(
                     onTap: () {

                      Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context)=> Login(),
                    ));

                      },
                     child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Text("Welcome", style: TextStyle(color: Colors.green[600], fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Quicksand" )),
                  )
                    ),
                  )
                )
              ],)
            ],
          )
     ) ;
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;
   SelectedPhoto({ this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto (){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4.0), 
          ),
        ),
      ),
    );
  }

  Widget _activePhoto (){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5.0), 
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.0,
                blurRadius: 2.0
              )
            ]
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots(){
    List<Widget> dots = [];

    for(int i =0; i < numberOfDots; ++i ){
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: _buildDots(),
      ),
    );
  }
}