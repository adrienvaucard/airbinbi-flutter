class City {
  int id;
  String name;

  City(this.id, this.name);

  City.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
  };
}