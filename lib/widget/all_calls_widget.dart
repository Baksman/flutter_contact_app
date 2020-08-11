//import 'dart:html';
import 'package:share/share.dart' as sh;
import 'package:call_log/call_log.dart';
import 'package:contactapp/model/call_log_model.dart';
//import 'package:contactapp/model/contact_model.dart';
import 'package:contactapp/service/call_log_services.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:share/share.dart';
//import 'package:contacts_service/contacts_service.dart';

class AllCallsWidget extends StatefulWidget {
  @override
  _AllCallsWidgetState createState() => _AllCallsWidgetState();
}

class _AllCallsWidgetState extends State<AllCallsWidget> {
  // Future contacts;
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    //contacts = CallsLogservices.getAllCallLogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Container(
          child: FutureBuilder(
            future: CallsLogservices.getAllCallLogs(),
            builder: (context, snapshot) {
              print("build gets called");
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      bool isNotNull =
                          snapshot.data[index]?.name != null ?? false;
                      return Slidable(
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            // onTap: () => _showSnackBar('More'),
                          ),
                          IconSlideAction(
                            caption: 'Message',
                            color: Colors.black45,
                            icon: Icons.message,
                            // onTap: () => _showSnackBar('More'),
                          ),
                        ],
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Call',
                            color: Colors.blue,
                            icon: Icons.call,
                            // onTap: () => _showSnackBar('Archive'),
                          ),
                          IconSlideAction(
                            caption: 'Share',
                            color: Colors.indigo,
                            icon: Icons.share,
                            onTap: () {
                              sh.Share.share( '');
                            },
                          ),
                        ],
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: ListTile(
                          trailing: _trailingWidget(snapshot.data[index]),
                          leading: isNotNull
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  child: Text(
                                    "${snapshot.data[index].name.substring(0, 1)}",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                              : CircleAvatar(
                                  backgroundColor: Colors.blue[200],
                                  child: IconButton(
                                      onPressed: () {
                                        _showDialog(snapshot.data[index]);
                                        // setState(() {

                                        // });
                                      },
                                      //     _showDialog(snapshot.data[index]),
                                      icon: Icon(Icons.add),
                                      color: Colors.blue),
                                ),
                          //  contentPadding: EdgeInsets.all(10),
                          title: Text(
                            snapshot.data[index].name ??
                                snapshot.data[index].phoneNumber ??
                                "",
                            style: TextStyle(
                                color: snapshot.data[index].callType ==
                                        CallType.missed
                                    ? Colors.red
                                    : Colors.black),
                          ),
                          subtitle: Text(
                            "${snapshot.data[index].duration} seconds" ?? "",
                            style: TextStyle(
                                color: snapshot.data[index].callType ==
                                        CallType.missed
                                    ? Colors.red
                                    : Colors.black),
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  _trailingWidget(CallLogModel model) {
    if (model.callType == CallType.missed) {
      return Icon(
        Icons.call_missed,
        color: Colors.red,
      );
    } else if (model.callType == CallType.incoming) {
      return Icon(
        Icons.call_received,
        color: Colors.green,
      );
    } else if (model.callType == CallType.outgoing) {
      return Icon(
        Icons.call_made,
        color: Colors.blue,
      );
    } else if (model.callType == CallType.rejected) {
      return Icon(Icons.call_end, color: Colors.teal);
    }
  }

  _showDialog(CallLogModel model) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Save contact"),
            content: TextFormField(
              controller: _textEditingController,
              validator: (String val) {
                if (val.isNotEmpty && int.tryParse(val) == null) {
                  return null;
                }
                return "invalid field";
              },
              decoration: InputDecoration(hintText: "name of contact"),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("CANCEL")),
              FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print("started save function");
                      await ContactsService.addContact(Contact(
                          givenName: _textEditingController.text,
                          phones: [
                            Item(label: "mobile", value: model.phoneNumber)
                          ]));
                      print(_textEditingController.text);
                      print("ended save function");
                      setState(() {
                        _textEditingController.clear();
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text("SAVE"))
            ],
          );
        });
  }
}
