import 'dart:ffi';

import 'package:airbinbi_flutter/bo/Picture.dart';

class Place {
  int id;
  String title;
  num price;
  String owner;
  String? description;
  Picture pic;
  List<String> dates;

  Place(this.id, this.title, this.price, this.owner, this.description, this.pic, this.dates);

  Place.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        title = json["title"],
        price = json["price"],
        owner = json["owner"],
        description = json["description"],
        pic = Picture.fromJson(json["illustrations"]),
        dates = List.from(json["listDateAvailable"]);

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "price" : price,
    "owner" : owner,
    "description" : description,
    "pic" : pic.toJson(),
    "dates": dates.toList()
  };
}