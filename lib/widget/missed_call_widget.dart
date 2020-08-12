import 'package:contactapp/service/call_log_services.dart';
import 'package:share/share.dart' as sh;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MissedCallWidget extends StatefulWidget {
  @override
  _MissedCallWidgetState createState() => _MissedCallWidgetState();
}

class _MissedCallWidgetState extends State<MissedCallWidget> {
  Future contacts;
  @override
  void initState() {
    contacts = CallsLogservices.getAllMissedCalls();
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
                            sh.Share.share('abracdabra');
                          },
                        ),
                      ],
                      actionPane: SlidableDrawerActionPane(),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        trailing: Icon(
                          Icons.call_missed,
                          color: Colors.red,
                        ),
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
                        title: Text(
                            snapshot.data[index].name ??
                                snapshot.data[index].phoneNumber,
                            style: TextStyle(color: Colors.red)),
                        subtitle: Text(
                          "${snapshot.data[index].duration}s" ?? "Empty",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor),
            );
          },
        ),
      ),
    );
  }
}
