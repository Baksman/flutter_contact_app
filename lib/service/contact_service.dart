//import 'package:contacts_service/contacts_service.dart';
import 'package:contactapp/model/contact_model.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactServices {
  static Future<List<ContactModel>> getContact() async {
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    return contacts.where((Contact val) {
      return (val.phones.isNotEmpty);
    }).map((Contact val) {
      return ContactModel(
          phoneNumber: val.phones.toString()[0] ?? "",
          name: val.displayName ?? "");
    }).toList();
  }

  static addContact() async {
    await ContactsService.addContact(Contact());
  }
}
