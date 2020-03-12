//import 'package:contacts_service/contacts_service.dart';
import 'package:contactapp/model/contact_model.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactServices {
  static Future<List<ContactModel>> getContact() async {
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    return contacts.toList().map((Contact val) {
      print("the .....${val.phones.toList()}");
      return ContactModel(
          phoneNumber: val.phones.toString()[0], name: val.displayName);
         
    }).toList();
  }
}
