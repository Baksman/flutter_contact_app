import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:contactapp/screen/call_log_4screen/call_log_screen.dart';
import 'package:contactapp/screen/call_log_screen/call_log_screen.dart';
import 'package:contactapp/screen/contact_screen/contact_screen.dart';
import 'package:contactapp/screen/settings/settinsgs_screen.dart';
import 'package:contactapp/screen/sms_screen/sms_page.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

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
  bool  isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
    
        bottomNavigationBar: BottomNavyBar(
         // backgroundColor: Colors.grey[200],
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
              activeColor:isDark ? Colors.white:Colors.blue,
              inactiveColor: isDark ? Colors.white:Colors.blue,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor:isDark ? Colors.white:Colors.blue,
                ),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
               activeColor:isDark ? Colors.white:Colors.blue,
                ),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
               activeColor:isDark ? Colors.white:Colors.blue,
                ),
          ],
        ),
      //  backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.keyboard,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              NumericKeyboard(onKeyboardTap: (String val) {
                print(val);
              });
            }),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
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
            SettingsSCreen()
          ],
        ));
  }
}
