import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class SettingsSCreen extends StatefulWidget {
  @override
  _SettingsSCreenState createState() => _SettingsSCreenState();
}

class _SettingsSCreenState extends State<SettingsSCreen> {
  bool switchValue = false;
  @override
  bool isDark;
  bool isNotified = true;
  @override
  // void didChangeDependencies() {
  //   isDark = Theme.of(context).brightness == Brightness.dark;
  //   super.didChangeDependencies();
  // }

  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    print("the value of bool is $isDark");
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "Settings",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 3.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/place_holder.png"))),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Ibrahim shehu",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text("Edit personal details")
                ],
              ),
              Spacer(),
              Icon(Icons.navigate_next),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            trailing: Switch(
                value: isDark,
                onChanged: (bool val) {
                  isDark = val;
                  setState(() {
                    if (!isDark) {
                      DynamicTheme.of(context).setBrightness(Brightness.light);
                      return;
                    }
                    DynamicTheme.of(context).setBrightness(Brightness.dark);
                  });
                }),
            leading: Icon(Icons.ac_unit),
            title: Text("Dark mode"),
          ),
          Text(
            "Profile",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text("Edit Profile"),
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change password"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Notifications",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            trailing: Switch(
              value: isNotified,
              onChanged: (val) {
                setState(() {
                  isNotified = val;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Regional"),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
