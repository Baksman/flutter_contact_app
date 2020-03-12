import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:contactapp/screen/contact_screen.dart';
import 'package:contactapp/widget/all_calls_widget.dart';
import 'package:contactapp/widget/missed_call_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
      int val = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        backgroundColor:Colors.grey[200],
   selectedIndex: 0,
   showElevation: true, // use this to remove appBar's elevation
   onItemSelected: (index) => setState(() {
              // _selectedIndex = index;
              // _pageController.animateToPage(index,
              //     duration: Duration(milliseconds: 300), curve: Curves.ease);
    }),
   items: [
     BottomNavyBarItem(
       icon: Icon(Icons.apps),
       title: Text('Home'),
       activeColor: Colors.blue,
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.people),
         title: Text('Users'),
         activeColor: Colors.blue
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.message),
         title: Text('Messages'),
         activeColor: Colors.blue
     ),
     
   ],
),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard, color:Colors.white,size: 25,),
        onPressed: (){}),
       body: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(children: <Widget>[
             Row(children: <Widget>[
               FlatButton(onPressed: (){
                 setState(() {
                   val = 0;
                 });
               }, child: Text("All",style: TextStyle(color:val == 0 ? Colors.black:Colors.grey),)),
               FlatButton(onPressed: (){
                 setState(() {
                   val = 1;
                 });
               }, child: Text("Missed",style: TextStyle(color:val == 1 ? Colors.black:Colors.grey),)),
               Spacer(),
               Icon(Icons.search)
             ],),
             SizedBox(height: 10,),
             if(val == 0) AllCallsWidget()
             else if(val == 1) MissedCallWidget()
           ],),
         )
       );
  }
}