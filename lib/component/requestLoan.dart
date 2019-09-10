import 'package:flutter/material.dart';
import 'package:our_money_app/utilities/general.dart';

class Request extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Request();
  }
}

class _Request extends State<Request> {
  List<double> _amount = [10000, 5000, 2000, 1000];
  List<String> _duration = ['Weekly', 'Monthly'];
  String _selectedDuration;
  double _selectedAmount;
  String request = '0';
  String payback = '0';

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    void _goto(int val) {
      _pageController.animateToPage(val,
          duration: Duration(milliseconds: 500), curve: SawTooth(1));
    }
  

 
  void total (value){
    setState(() {
    request= value.toStringAsFixed(2);
    payback = ((_selectedAmount * 0.2)+_selectedAmount).toStringAsFixed(2);
  });
  }
  
  

    List<Widget> _pages(context) {
      
      return <Widget>[

        ///--- Request loan ----/////
        Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(fit: StackFit.expand, children: <Widget>[
              whiteBackground(),
              ListView(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notification_important,
                          size: 20.0,
                          color: Colors.green[700],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Select your loan amount and terms below',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green[700],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, right: 10.0, left: 10.0, bottom: 10.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.green,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage('images/ads.jpeg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: DropdownButton(
                      hint: Text('Click here to select loan amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green[600],
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight
                                  .bold)), // Not necessary for Option 1
                      value: _selectedAmount,
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      onChanged: (newValue) {
                         total(newValue);
                        setState(() {
                          _selectedAmount = newValue;
                         
                        });
                      },
                      items: _amount.map((amount) {
                        return DropdownMenuItem(
                          child: new Text(
                            amount.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: amount,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DropdownButton(
                      elevation: 30,
                      hint: Text('Payment duration',
                          style: TextStyle(
                              color: Colors.green[600],
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight
                                  .bold)), // Not necessary for Option 1
                      value: _selectedDuration,
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDuration = newValue;
                        });
                      },
                      items: _duration.map((duration) {
                        return DropdownMenuItem(
                          child: new Text(
                            duration,
                            textAlign: TextAlign.center,
                          ),
                          value: duration,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Requested Amount',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 18),
                          ),
                          Text(request,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 18))
                        ],
                      )),
                      SizedBox(height: 20,),
                      Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Payback Amount',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 18),
                          ),
                          Text(payback,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 18))
                        ],
                      )),
                      Padding(
                        padding: EdgeInsets.only(left:30, right: 30, top: 20),
                        child: Container(
    alignment: Alignment.center,
    height: 30.0,
    decoration: BoxDecoration(
      color: Colors.red[300],
      borderRadius: BorderRadius.circular(5.0)
    ),
    child:  Row(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: <Widget>[
          Icon(Icons.info, size: 14.0, color: Colors.white,),
          SizedBox(width: 10.0,),
          Text('Our Money interest rate are calculated at 10%', style: TextStyle(color: Colors.white, fontSize: 15.0,),),
      ],
    ),
  
  ),
                        ),
                     
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                     _goto(1);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                      child: successButton('Request This Loan', Colors.white)),
                  ),
                  
                  Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: defaultButton('Loan details ', Colors.black54))
                ],
              )
            ])),

          /// -------- Loan Requested -----/////
          Container(
             height: MediaQuery.of(context).size.height,
            child: Stack(fit: StackFit.expand, children: <Widget>[
              whiteBackground(),
              ListView(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notification_important,
                          size: 20.0,
                          color: Colors.green[700],
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]
          )
             ] )
          ),

 
      ];
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green[500],
          title: Text('Loan Request',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand')),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body: PageView(
        children: _pages(context),
        onPageChanged: (val) {},
        controller: _pageController,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
