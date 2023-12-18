import 'package:crud_contacts/controllers/contact_controller.dart';
import 'package:crud_contacts/views/new_contact_screen.dart';
import 'package:crud_contacts/views/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Saving App"),
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: InkWell(
                onTap: () {
                  Get.to(NewContactScreen());
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Create new contact",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => contactController.contactsList.isNotEmpty
                ? Column(
                    children: contactController.contactsList
                        .map((e) => ContactWidget(contactModel: e))
                        .toList(),
                  )
                : Center(
                    child: Text(
                      "No Contact added",
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
