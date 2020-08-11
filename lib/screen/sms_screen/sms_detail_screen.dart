import 'package:contactapp/service/sms_service.dart';
import 'package:contactapp/utils/snackabr_utils.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:sms/sms.dart';

class MessageDetailsScreen extends StatefulWidget {
  MessageDetailsScreen(this.smsMessage);
  final SmsMessage smsMessage;

  @override
  _MessageDetailsScreenState createState() => _MessageDetailsScreenState();
}

class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  TextEditingController _controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final text = "";
  bool isTextEmpty = true;
  @override
  void initState() {
    _controller.addListener(() {
      if (text.isEmpty) {
        setState(() {
          isTextEmpty = true;
        });
      } else {
        setState(() {
          isTextEmpty = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/place_holder.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text("${widget.smsMessage.sender}"),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Bubble(
                  shadowColor: Colors.black12,
                  padding: BubbleEdges.all(10),
                  radius: Radius.circular(10),
                  //  style: BubbleStyle(),
                  child: Text(widget.smsMessage.body),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      try {
                        _sendSms(widget.smsMessage.address, text, context);
                      } catch (e) {
                        SnackBarUtils.showSnackBar(
                            _scaffoldKey, "Couldnot send");
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  _sendSms(String address, String message, BuildContext context) {
    SmsService().sendSms(address, message, context);
  }
}
