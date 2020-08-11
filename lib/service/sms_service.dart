import 'package:contactapp/utils/snackabr_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:sms/sms.dart';

class SmsService {
  SmsQuery query = SmsQuery();

  //to get all sms
  Future<List<SmsMessage>> getAllSms() async {
    List<SmsMessage> smsList = await query.getAllSms;
    return smsList;
  }

//get only sent sms
  Future<List<SmsMessage>> getSentSms() async {
    List<SmsMessage> sentSmsList =
        await query.querySms(kinds: [SmsQueryKind.Sent]);
    return sentSmsList;
  }

  sendSms(String address, String message, BuildContext context) {
    SmsSender sender = new SmsSender();
    SmsMessage smsM = SmsMessage(address, message);

    smsM.onStateChanged.listen((event) {
      if (event == SmsMessageState.Sending) {
        //show snackbar
      } else if (event == SmsMessageState.Sent) {
        SnackBarUtils.showContextSnackBar(context, "Sms sent");
      } else if (event == SmsMessageState.Fail) {
        SnackBarUtils.showContextSnackBar(context, "Failed");
      } else if (event == SmsMessageState.Delivered) {
        SnackBarUtils.showContextSnackBar(context, "Sms delivered");
      }
    });
    sender.sendSms(smsM);
  }
}
