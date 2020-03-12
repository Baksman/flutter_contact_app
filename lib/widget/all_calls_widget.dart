import 'package:call_log/call_log.dart';
import 'package:contactapp/model/call_log_model.dart';
import 'package:contactapp/service/call_log_services.dart';
import 'package:flutter/material.dart';
//import 'package:contacts_service/contacts_service.dart';

class AllCallsWidget extends StatefulWidget {
  @override
  _AllCallsWidgetState createState() => _AllCallsWidgetState();
}

class _AllCallsWidgetState extends State<AllCallsWidget> {
  Future contacts;
  @override
  void initState() {
    contacts = CallsLogservices.getAllCallLogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder(
          future: contacts,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    bool isNotNull =
                        snapshot.data[index]?.name != null ?? false;
                    print("the length is ${snapshot.data.length}");
                    return ListTile(
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
                              child: Icon(Icons.add, color: Colors.blue),
                            ),
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                        snapshot.data[index].name ??
                            snapshot.data[index].phoneNumber ??
                            "",
                        style: TextStyle(
                            color:
                                snapshot.data[index].callType == CallType.missed
                                    ? Colors.red
                                    : Colors.black),
                      ),
                      subtitle: Text(
                        "${snapshot.data[index].duration} seconds" ?? "",
                        style: TextStyle(
                            color:
                                snapshot.data[index].callType == CallType.missed
                                    ? Colors.red
                                    : Colors.black),
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
      return Icon(Icons.call_end,color:Colors.teal);
    }
  }
}
