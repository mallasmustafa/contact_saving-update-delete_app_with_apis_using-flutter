import 'package:crud_contacts/models/contact_model.dart';
import 'package:crud_contacts/views/contact_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactWidget extends StatelessWidget {
  ContactModel contactModel;
 ContactWidget({super.key, required this.contactModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(ContactDetailScreen(contactModel: contactModel));
      },
      leading: const CircleAvatar(
        radius: 30,
        child: Icon(
          Icons.person,
          size: 30,
        ),
      ),
      title: Text(
        contactModel.name.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(contactModel.number.toString()),
    );
  }
}
