import 'package:call_log/call_log.dart';
import "package:contactapp/model/call_log_model.dart";

class CallsLogservices {
  static Future<List<CallLogModel>> getAllCallLogs() async {
    Iterable<CallLogEntry> entries = await CallLog.get();
    return entries.toList().map((val) {
      return CallLogModel(
          name: val.name,
          phoneNumber: val.formattedNumber,
          callType: val.callType,
          duration: val.duration);
    }).toList();
  }

  static Future<List<CallLogModel>> getAllMissedCalls() async {
    Iterable<CallLogEntry> entries = await CallLog.query(type: CallType.missed);
    return entries.toList().map((val) {
      return CallLogModel(
          name: val.name,
          phoneNumber: val.formattedNumber,
          duration: val.duration);
    }).toList();
  }
}
