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
  TextEditingController _textController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final text = "";
  bool isEmpty = true;
  @override
  void initState() {
     isEmpty = _textController.text.trim().isEmpty;
    _textController.addListener(() {
      if (isEmpty != _textController.text.trim().isEmpty) {
        if (mounted) {
          setState(() {
            isEmpty = _textController.text.trim().isEmpty;
          });
        }
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
                  child: Text(widget.smsMessage.body,style:TextStyle(color: Colors.black) ,),
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
                    controller: _textController,
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
