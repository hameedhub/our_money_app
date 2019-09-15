import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:our_money_app/component/notice.dart';
import 'package:our_money_app/component/requestLoan.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  final user;
  Dashboard(this.user);

  @override
  State<StatefulWidget> createState() {
    return _Dashboard(this.user);
  }
}

class _Dashboard extends State<Dashboard> with TickerProviderStateMixin {
  AnimationController _controller;
  final user;
  _Dashboard(this.user);

  //static const List<IconData> icons = const [ Icons.monetization_on ];

  @override
  void initState() {
    lastRequest();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }
  int payback = 0;
  String status = '';
  bool _loading =true;

  void lastRequest() async {
      var result = await ApiService.getData('trans', user.token);
      if(result.containsKey('data')){
       setState(() {
          payback = result['data'][0]['payback'];
          _loading = false;
       });
      
      } else{
        
      }
    }

  int photoIndex = 0;
  List<String> photos = ['images/welcome.jpeg', 'images/ads.jpeg'];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            //new Column(
            // mainAxisSize: MainAxisSize.min,
            // children: List.generate(icons.length, (int index) {
            //   Widget child = new Container(
            //     height: 70.0,
            //     width: 56.0,
            //     alignment: FractionalOffset.topCenter,
            //     child: new ScaleTransition(
            //       scale: new CurvedAnimation(
            //         parent: _controller,
            //         curve: new Interval(
            //           0.0,
            //           1.0 - index / icons.length / 2.0,
            //           curve: Curves.easeOut
            //         ),
            //       ),
            //       child: FloatingActionButton.extended(

            //         label: Text("Loan", textAlign: TextAlign.left, style: TextStyle(color: Colors.green[600], fontWeight: FontWeight.bold,),),
            //         heroTag: null,

            //         onPressed: () {
            //           Navigator.push(context, MaterialPageRoute(
            //             builder: (context) => Request()
            //           ));
            //         },
            //       ),
            //     ),
            //   );
            //   return child;
            // }).toList()..add(
            FloatingActionButton.extended(
          label: Text('Request',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white)),
          backgroundColor: Colors.green,
          //heroTag: 'Request',
          icon: new AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return new Transform(
                transform:
                    new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                alignment: FractionalOffset.center,
                child: new Icon(
                  _controller.isDismissed
                      ? Icons.arrow_forward_ios
                      : Icons.close,
                  color: Colors.white,
                ),
              );
            },
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Request(user)));
            // if (_controller.isDismissed) {
            //   _controller.forward();
            // } else {
            //   //_controller.reverse();
            // }
          },
        ),
        // ),
        //),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            whiteBackground(),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 10.0,
                        blurRadius: 10.0)
                  ],
                  image: DecorationImage(
                      image: AssetImage('images/bg.png'), fit: BoxFit.fill)),
            ),
            Container(
                height: 350.0,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green[500],
                        gradient: LinearGradient(
                            colors: [
                              Colors.green[700],
                              Colors.green[700],
                              Colors.green[800],
                              Colors.green[700],
                              Colors.green[500],
                              Colors.green[800],
                              Colors.green[700]
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.bottomCenter)),
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notice(user)));
                            },
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow[900],
                                        border: Border.all(
                                            color: Colors.yellow[900],
                                            width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Center(
                                        child: Text(1.toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Hello, " + user.firstName + ' ' + user.lastName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150.0,
                    left: 20.0,
                    right: 20.0,
                    child: Container(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(7.0),
                        child: Container(
                          height: 120.0,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.green,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: 15,
                              ),
                            ],
                            color: Colors.white,
                            // gradient: LinearGradient(
                            //     colors: [
                            //       Colors.limeAccent[100],
                            //       Colors.white
                            //     ],
                            //     begin: Alignment.centerRight,
                            //     end: Alignment(-1.0, -1.0))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Image.asset(
                                  "images/wallet.png",
                                  fit: BoxFit.cover,
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Visibility(
                     visible: _loading,
                     child:
                      Center(
                        child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.green,
                                    ),
                      ),
                      replacement:  Text(
                                      "₦ "+payback.toString(),
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    )
                      
                      )
                                    
                                    
                                   
                                    ),
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.0),
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        child: Divider(
                                          color: Colors.green,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text("Pending Payment",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 2.0,
                                    ),
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        child: Divider(
                                          color: Colors.green,
                                        )),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 280),
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 50.0, top: 50),
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.green,
                                                  spreadRadius: 5.0,
                                                  blurRadius: 10.0)
                                            ],
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    photos[photoIndex]),
                                                fit: BoxFit.fill)),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.transparent),
                                        onTap: _nextImage,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            color: Colors.transparent),
                                        onTap: _previousImage,
                                      ),
                                      Positioned(
                                        top: 120,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                60.0,
                                        child: Row(
                                          children: <Widget>[
                                            SelectedPhoto(
                                              numberOfDots: photos.length,
                                              photoIndex: photoIndex,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                ])),
          ],
        ));
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;
  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
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

  Widget _activePhoto() {
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
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
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
