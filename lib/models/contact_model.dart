
class ContactModel {
  int? number;
  String? name;
  String? id;

  ContactModel({this.number, this.name, this.id});

  ContactModel.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    name = json["name"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["number"] = number;
    _data["name"] = name;
    _data["id"] = id;
    return _data;
  }
}