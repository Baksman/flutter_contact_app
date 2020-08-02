import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:contactapp/screen/call_log_4screen/call_log_screen.dart';
import 'package:contactapp/screen/call_log_screen/call_log_screen.dart';
import 'package:contactapp/screen/contact_screen/contact_screen.dart';
import 'package:contactapp/screen/sms_screen/sms_page.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.grey[200],
          selectedIndex: currentIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.blue),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.blue),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.keyboard,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              setState(() {});
            }),
        body: PageView(
          controller: pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: <Widget>[
            CallLogScreen(),
            ContactScreen(),
            SmsScreen(),
          ],
        ));
  }
}
