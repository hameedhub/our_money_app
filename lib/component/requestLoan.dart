import 'package:flutter/material.dart';
import 'package:our_money_app/services/api_service.dart';
import 'package:our_money_app/utilities/general.dart';

class Request extends StatefulWidget {
  final user;
  Request(this.user);
  @override
  State<StatefulWidget> createState() {
    return _Request(this.user);
  }
}

class _Request extends State<Request> {
  final user;
  _Request(this.user);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<double> _amount = [10000, 5000, 2000, 1000];
  List<String> _duration = ['Weekly', 'Monthly'];
  String _selectedDuration;
  double _selectedAmount;
  String request = '0';
  String payback = '0';
  bool _isWorking = false;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    void _goto(int val) {
      _pageController.animateToPage(val,
          duration: Duration(milliseconds: 500), curve: SawTooth(1));
    }
  

 
  void total (value){
    setState(() {
    request= '₦'+value.toStringAsFixed(2);
    var cal = (value * 0.2)+value;
    payback = '₦'+cal.toStringAsFixed(2);
  });
  }

void errorSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}
void successSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.green[400]
    ));
}
_isLoading(){
      setState((){
        _isWorking = true;
      });
    }
    _isNotLoading(){
      setState((){
        _isWorking= false;
      });
    }
requestLoan() async {
  _isLoading();
  var day;
  if(_selectedDuration == 'Monthly'){
     day = 30;
  }else{ day = 7; }
    final data = {
      "amount": _selectedAmount.toStringAsFixed(2),
      "duration": day.toString()
    };
    print(data);
        var result = await ApiService.postDataWithToken(data, 'request/make', user.token);
        print(result);
        if (result.containsKey('data')) {
         successSnackBar(result['message'].toString());
         _isNotLoading();
        } else {
          _isNotLoading();
          errorSnackBar(result['error'].toString());
        }
      

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
                     
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                              child: Visibility(
                                visible:_isWorking,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                
                                 
                                
          
                                replacement:  Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 20, right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      requestLoan();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height:50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        child: successButton('Request Loan', Colors.white),)
                                  ),
                                )
                              ),
                            ),
                  // GestureDetector(
                  //   onTap: (){
                  //    requestLoan();
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  //     child: successButton('Request This Loan', Colors.white)),
                  // ),
                   SizedBox(height: 10,),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
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
      key: _scaffoldKey,
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
