import 'package:contactapp/service/contact_service.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        initialData: [],
          future: ContactServices.getContact(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.separated(
                separatorBuilder: (context,int){
                  return Divider();
                },
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {

                return ListTile(
                  leading: CircleAvatar(child:Text("${snapshot.data[index]?.name?.substring(0,2) } " ?? "")),
                  title: Text(snapshot.data[index].name ?? ""),
                );
              });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
