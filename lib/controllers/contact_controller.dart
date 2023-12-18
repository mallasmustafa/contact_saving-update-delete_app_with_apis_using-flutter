import 'dart:convert';
import 'package:crud_contacts/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getContact();
  }

  String baseUrl = "https://657ed96f3e3f5b1894644407.mockapi.io/contact";
  RxList<ContactModel> contactsList = RxList<ContactModel>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameDetailController = TextEditingController();
  TextEditingController numberDetailController = TextEditingController();

  Future<void> getContact() async {
    var ressponse = await http.get(
      Uri.parse(baseUrl),
    );
    var data = jsonDecode(ressponse.body);
    contactsList.clear();
    for (var element in data) {
      contactsList.add(ContactModel.fromJson(element));
    }
    if (ressponse.statusCode == 200) {
      print("Api Get");
    } else {
      Get.snackbar("Check Internet Connection", "Something went wrong");
    }
  }

  Future<void> addContact() async {
    var newContact = ContactModel(
      name: nameController.text,
     // number:  numberController.text,
      number: int.parse(numberController.text)
    );
    if (nameController.text != "" && numberController.text != "") {
      var respone = await http.post(Uri.parse(baseUrl),
          body: jsonEncode(newContact.toJson()),
          headers: {
            "Content-type": "application/json",
          });
      if (respone.statusCode == 201) {
        nameController.clear();
        numberController.clear();
        getContact();
      } else {
        Get.snackbar("Not add Contact", "Something went wrong");
      }
    } else {
      Get.snackbar("Contact not save", "Enter all field");
    }
  }

  Future<void> updateContact(String id) async {
    var newUrl2 = "https://657ed96f3e3f5b1894644407.mockapi.io/contact/$id";
    var updateContact = ContactModel(
      name: nameDetailController.text,
      number: int.parse(numberDetailController.text),
    );
    var response = await http.put(Uri.parse(newUrl2),
        body: jsonEncode(updateContact.toJson()),
        headers: {
          "Content-type": "application/json",
        });
    if (response.statusCode == 200) {
      print("Contact updated");
      getContact();
    } else {
      Get.snackbar("Check Internet Connection", "Something went wrong");
    }
  }

  Future<void> deleteContact(String id) async {
    var newUrl = "https://657ed96f3e3f5b1894644407.mockapi.io/contact/$id";
    var response = await http.delete(Uri.parse(newUrl));
    if (response.statusCode == 200) {
      getContact();
      print("Deleted Contact");
    } else {
      Get.snackbar(
          "Delete Contact", "Check internet Connection something went wrong");
    }
  }
}
