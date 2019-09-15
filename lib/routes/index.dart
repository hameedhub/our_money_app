import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:our_money_app/component/dashboard.dart';
import 'package:our_money_app/component/profile.dart';
import 'package:our_money_app/component/transaction.dart';


class Index extends StatefulWidget{
  final user;
  Index(this.user);

  @override
  State<StatefulWidget> createState() {
   
    return _Index(this.user);
  }
}

class _Index extends State<Index> with SingleTickerProviderStateMixin {
  int currentTab = 0;
  Dashboard dashboard;
  Transaction transaction;
  Profile profile;
  List trans = List();
  
  List<Widget>pages;
  Widget currentPage;

  _Index(this.user);

  final user;
  
  @override
  void initState() {
        dashboard = Dashboard(user);
        transaction = Transaction(user);
        //notice = Notice();
        profile = Profile(user);
        pages =[ profile, dashboard, transaction,];
    
        currentPage = dashboard;
        super.initState();
      }
      
    
      @override
      Widget build(BuildContext context) {
       
        return Scaffold(
          body: currentPage,
          bottomNavigationBar:
          FancyBottomNavigation(
            circleColor: Colors.green[600],
            inactiveIconColor: Colors.green[600],
            initialSelection: 1,
    tabs: [
       
        TabData(iconData: Icons.account_circle, title: "Profile"),
        TabData(iconData: Icons.home, title: "Home",),
         TabData(iconData: Icons.autorenew, title: "Transaction")
        
    ],
    onTabChangedListener: (int index) {
        setState(() {
        currentPage = pages[index];
        });
    },
        //    BottomNavigationBar(
        //      onTap: ( int index) {
        //        setState((){
        //          currentTab = index;
        //          currentPage = pages[index];
        //        });
               
        //   },
        //   currentIndex: currentTab,
        //   fixedColor:Colors.green,
        //   type: BottomNavigationBarType.fixed,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
              
        //         backgroundColor: Colors.white,
        //         icon: Icon(
        //           Icons.home,
        //         ),
        //         title: Text("Dashboard")),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.notifications,
        //         ),
        //         title: Text("Transaction")),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.chat,
        //         ),
        //         title: Text("Notification")),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.account_circle,
        //         ),
        //         title: Text("Profile")),
        //   ],
        // )
        )
        );
      }
    
}