import 'package:contactapp/screen/sms_screen/sms_detail_screen.dart';
import 'package:contactapp/service/sms_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sms/sms.dart';

class SentSmsScreen extends StatefulWidget {
  @override
  _SentSmsScreenState createState() => _SentSmsScreenState();
}

class _SentSmsScreenState extends State<SentSmsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SmsMessage>>(
      future: SmsService().getSentSms(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.teal,
          ));
        }

       else if (snapshot.data.length == 0) {
          return Center(
            child: Text("You dont have any text message"),
          );
        }

        return Expanded(
        //  height:300,
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
            SmsMessage smsMessage = snapshot.data[index];
            return ListTile(
              onTap: () {
                toDetailsScreen(smsMessage);
              },
              trailing: smsMessage.isRead ? Icon(Icons.done_all,color:Colors.blue,) : Icon(Icons.done),
              //trailing: trailingIcon(smsMessage.kind),
              title: Text("${smsMessage.address}"),
              subtitle: Text("${smsMessage.body}"),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/place_holder.png"),
                backgroundColor: Colors.teal,
              ),
            );
          }),
        );
      },
    );
  }

  Icon trailingIcon(SmsMessageKind messageKind) {
    if (messageKind == SmsMessageKind.Sent) {
      return Icon(Icons.message);
    } else if (messageKind == SmsMessageKind.Received) {
      return Icon(Icons.sms);
    }
    return Icon(Icons.sms_failed);
  }

  toDetailsScreen(SmsMessage smsMessage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MessageDetailsScreen(smsMessage);
    }));
  }
}
