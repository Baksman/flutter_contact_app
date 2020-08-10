import 'package:contactapp/screen/sms_screen/received_sms_screen.dart';
import 'package:contactapp/screen/sms_screen/sent_sms_screen.dart';
import 'package:contactapp/screen/sms_screen/sent_sms_screen.dart';
import "package:flutter/material.dart";

class SmsScreen extends StatefulWidget {
  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Received sms",
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
                    "Sent sms",
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
            ReceivedSmsScreen()
          else if (currentIndex == 1)
            SentSmsScreen()
        ],
      ),
    );
  }
}
