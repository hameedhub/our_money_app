import 'package:flutter/material.dart';
import 'package:our_money_app/component/dashboard.dart';
import 'package:our_money_app/component/notice.dart';
import 'package:our_money_app/component/profile.dart';
import 'package:our_money_app/component/transaction.dart';
import 'package:our_money_app/model/User.dart';
import 'package:our_money_app/services/storage.dart';
import 'package:our_money_app/services/userData.dart';

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
  Notice notice;
  Profile profile;
  
  List<Widget>pages;
  Widget currentPage;

  _Index(this.user);

  final user;
  
  @override
  void initState() {
        dashboard = Dashboard(user);
        transaction = Transaction();
        notice = Notice();
        profile = Profile(user);
        pages =[dashboard, transaction, notice, profile];
    
        currentPage = dashboard;
        super.initState();
      }
      
    
      @override
      Widget build(BuildContext context) {
       
        return Scaffold(
          body: currentPage,
          bottomNavigationBar:
           BottomNavigationBar(
             onTap: ( int index) {
               setState((){
                 currentTab = index;
                 
                 currentPage = pages[index];
                 print(currentTab);
               });
               
          },
          currentIndex: currentTab,
          fixedColor:Colors.green,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home,
                ),
                title: Text("Dashboard")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                title: Text("Transaction")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                title: Text("Notification")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                title: Text("Profile")),
          ],
        )
        );
      }
    
    
}