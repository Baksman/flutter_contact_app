
import 'package:contactapp/widget/all_calls_widget.dart';
import 'package:contactapp/widget/missed_call_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Column(
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
                            color: currentIndex == 0 ? Colors.black : Colors.grey),
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
                            color: currentIndex == 1 ? Colors.black : Colors.grey),
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
    );
  }
}