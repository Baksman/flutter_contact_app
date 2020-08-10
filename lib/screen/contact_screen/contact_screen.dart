import 'package:contactapp/service/contact_service.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
// SlidableController slidableController;
  int currentPage = 0;

  @override
  void initState() {
    // SlidableController()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {});
      }),
      body: FutureBuilder(
          // initialData: [],
          future: ContactServices.getContact(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  // reverse: true,
                  separatorBuilder: (context, int) {
                    return Divider();
                  },
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                      if ((snapshot.data[index]?.name?.substring(0, ) != null ??
                              false) &&
                          (snapshot?.data[index].name != null ?? false)) {
                        return ListTile(
                          leading: CircleAvatar(
                              // child: Text(
                              //     "${snapshot.data[index]?.name?.substring(0, 2)} " ??
                              //         "")
                                      ),
                          title: Text(snapshot?.data[index].name ?? ""),
                        );
                      }
                      return Offstage();
                    }
                  //   return ListTile();
                  // }
                  );
            }
            return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor),
            );
          }),
    );
  }
}
