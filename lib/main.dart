import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:contactapp/screen/home_screen.dart';
//import 'package:contactapp/screen/contact_screen.dart';
import 'package:contactapp/widget/all_calls_widget.dart';
import 'package:contactapp/widget/missed_call_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.grey[200],
          selectedIndex: 0,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          // items: [
          //   BottomNavyBarItem(
          //     icon: Icon(Icons.apps),
          //     title: Text('Home'),
          //     activeColor: Colors.blue,
          //     inactiveColor: Colors.grey,
          //   ),
          //   BottomNavyBarItem(
          //       icon: Icon(Icons.people),
          //       title: Text('Contacts'),
          //       activeColor: Colors.blue),
          //   BottomNavyBarItem(
          //       icon: Icon(Icons.message),
          //       title: Text('Messages'),
          //       activeColor: Colors.blue),
          //       BottomNavyBarItem(
          //       icon: Icon(Icons.settings),
          //       title: Text('Settings'),
          //       activeColor: Colors.blue),
          // ],
        ),
        backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(
        //     child: Icon(
        //       Icons.keyboard,
        //       color: Colors.white,
        //       size: 25,
        //     ),
        //     onPressed: () {
        //       NumericKeyboard(onKeyboardTap: (String val) {
        //         print(val);
        //       });
        //     }),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Text(
                        "All",
                        style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.black : Colors.grey),
                      )),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Text(
                        "Missed",
                        style: TextStyle(
                            color:
                                currentIndex == 1 ? Colors.black : Colors.grey),
                      )),
                  Spacer(),
                  Icon(Icons.search)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (currentIndex == 0)
                AllCallsWidget()
              else if (currentIndex == 1)
                MissedCallWidget()
            ],
          ),
        ));
  }
}
