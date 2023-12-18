import 'package:crud_contacts/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewContactScreen extends StatelessWidget {
  const NewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController controller = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.numberController,
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
                  controller.addContact();
                  Get.back();
                },
                child: const Text("S A V E Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
