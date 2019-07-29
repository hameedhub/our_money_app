import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, color: Colors.lightGreenAccent[700]),
              ),
              Tab(
                icon: Icon(Icons.history, color: Colors.grey),
              ),
              Tab(
                icon: Icon(Icons.inbox, color: Colors.grey),
              ),
              Tab(
                icon: Icon(Icons.person_outline, color: Colors.grey),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          gradient: LinearGradient(
                              colors: [
                                Colors.green[600],
                                Colors.limeAccent[100]
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment(-1.0, -1.0))),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0,
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage('images/avatar.png'))),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('HAMEED',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "Quicksand"
                                    )),
                                Text('0706***7799',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(7.0),
                            child: Container(
                              height: 120.0,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                                  color: Colors.white,
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.limeAccent[100],
                                        Colors.white
                                      ],
                                      begin: Alignment.centerRight,
                                      end: Alignment(-1.0, -1.0))),
                                      
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
                                        child: Text(
                                          "₦ 200,000",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.bold, fontFamily: "Quicksand",),
                                        )),
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                              image: DecorationImage(
                                image: AssetImage('images/ads.jpeg'),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.lightGreen,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                SizedBox(width: 10.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.red.withOpacity(0.3)),
                                    child: Icon(Icons.account_balance_wallet,
                                        color: Colors.red, size: 25.0),
                                  ),
                                  SizedBox(width: 15.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        100.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Request Loan',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold, fontFamily: "Quicksand",),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                             Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.lightGreen,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                SizedBox(width: 10.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.blue.withOpacity(0.3)),
                                    child: Icon(Icons.insert_chart,
                                        color: Colors.blue, size: 25.0),
                                  ),
                                  SizedBox(width: 15.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        100.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Make Deposit',
                                          style: TextStyle(
                                              fontFamily: "Quicksand",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold
                                               ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                             Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.lightGreen,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                SizedBox(width: 10.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.green.withOpacity(0.3)),
                                    child: Icon(Icons.account_balance,
                                        color: Colors.green, size: 25.0),
                                  ),
                                  SizedBox(width: 15.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        100.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Bank Accounts',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold, fontFamily: "Quicksand"),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.lightGreen,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 40.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                SizedBox(width: 10.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.yellow.withOpacity(0.1)),
                                    child: Icon(Icons.payment,
                                        color: Colors.yellow[600], size: 25.0),
                                  ),
                                  SizedBox(width: 15.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        100.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Pay Bills',
                                          style: TextStyle(
                                            fontFamily: "Quicksand",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
