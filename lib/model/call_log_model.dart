//import '';

import 'package:call_log/call_log.dart';

class CallLogModel{
 final String name;
 final String phoneNumber;
 final CallType callType;
 final int duration;

 CallLogModel({this.callType=CallType.missed,this.name,this.phoneNumber,this.duration});

}