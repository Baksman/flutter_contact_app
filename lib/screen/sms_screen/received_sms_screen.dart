import 'package:contactapp/screen/sms_screen/sms_detail_screen.dart';
import 'package:contactapp/service/sms_service.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class ReceivedSmsScreen extends StatefulWidget {
  @override
  _ReceivedSmsScreenState createState() => _ReceivedSmsScreenState();
}

class _ReceivedSmsScreenState extends State<ReceivedSmsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SmsMessage>>(
      future: SmsService().getAllSms(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
          ));
        } else if (snapshot.data.length == 0) {
          return Center(
            child: Text("You dont have any text message"),
          );
        }

        return Expanded(
          // height: 300,
          child: ListView.builder(itemBuilder: (context, index) {
            SmsMessage smsMessage = snapshot.data[index];
            return ListTile(
              onTap: () {
                toDetailsScreen(smsMessage);
              },
              trailing: trailingIcon(smsMessage.kind),
              title: Text("${smsMessage.address}"),
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
