import 'package:flutter/material.dart';

class SnackBarUtils {
  static showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String title,[int duration = 2]) {
    final snackbar =
        SnackBar(duration: Duration(seconds: duration), content: Text(title));
    // content: Text("you cannot use a file that is larger than 100kb"));
    _scaffoldKey.currentState..hideCurrentSnackBar()
    ..showSnackBar(snackbar);
  }

  static showContextSnackBar(BuildContext context,String title){
    final snackbar =
        SnackBar(duration: Duration(seconds: 4), content: Text(title));
        Scaffold.of(context)..
        hideCurrentSnackBar()
        ..showSnackBar(snackbar);
  }

}
 
