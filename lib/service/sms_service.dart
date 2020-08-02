import 'package:sms/sms.dart';

class SmsService {
  SmsQuery query = SmsQuery();

  //to get all sms 
  Future<void> getAllSms() async {
    List<SmsMessage> smsList = await query.getAllSms;
    return smsList;
  }

  
  
}
