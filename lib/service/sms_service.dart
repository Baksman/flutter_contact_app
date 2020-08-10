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
}
