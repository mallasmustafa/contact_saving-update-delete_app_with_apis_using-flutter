import 'package:crud_contacts/controllers/contact_controller.dart';
import 'package:crud_contacts/models/contact_model.dart';
import 'package:crud_contacts/views/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailScreen extends StatelessWidget {
  ContactModel contactModel;
  ContactDetailScreen({super.key, required this.contactModel});

  @override
  Widget build(BuildContext context) {
    ContactController controller = Get.put(ContactController());
    controller.nameDetailController.text = contactModel.name.toString();
    controller.numberDetailController.text = contactModel.number.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) => const Text("Delete Contact"),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("Delete Contact"),
                  onTap: () {
                    dailogBox(context, controller);
                    //  controller.deleteContact(contactModel.id!);
                    // Get.back();
                  },
                )
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameDetailController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.numberDetailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.updateContact(contactModel.id!);
                  Get.back();
                },
                child: const Text("UPDATE Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> dailogBox(BuildContext context, controller) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Contant"),
          content: Text("Are you sure to delete this contact"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cencel"),
            ),
            TextButton(
              onPressed: () {
                controller.deleteContact(contactModel.id!);
                Get.to(ContactScreen());
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
