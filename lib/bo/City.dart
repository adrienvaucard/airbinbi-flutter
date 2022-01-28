import 'package:airbinbi_flutter/bo/Picture.dart';

class City {
  int id;
  String name;
  Picture pic;

  City(this.id, this.name, this.pic);

  City.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"],
        pic = Picture.fromJson(json["pic"]);

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "pic" : pic.toJson(),
  };
}