import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class MessageDetailsScreen extends StatefulWidget {
  MessageDetailsScreen(this.smsMessage);
  final SmsMessage smsMessage;

  @override
  _MessageDetailsScreenState createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/place_holder.png"),
            ),
            Text("${widget.smsMessage.sender}"),
          
          ],
        ),
      
      ),

      body: ListView(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
