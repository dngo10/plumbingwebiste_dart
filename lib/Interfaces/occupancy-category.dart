import 'dart:convert';

import 'table422_1Units.dart';

class TypeOfOccupancy {
  String id;
  String type;
  String sub_type;
  String description;

  TypeOfOccupancy(this.id, this.type, this.sub_type, this.description);

  TypeOfOccupancy clone(){
    TypeOfOccupancy typeOfOccupancy = TypeOfOccupancy(this.id, this.type, this.sub_type, this.description);
    return typeOfOccupancy;
  }

  void Merge(TypeOfOccupancy occupancy){
    this.type = occupancy.type;
    this.sub_type = occupancy.sub_type;
    this.description = occupancy.description;
  }

  String toJson(){
    Map map = {
      "id": id,
      "type": type,
      "sub_type": sub_type,
      "description": description
    };
    return jsonEncode(map);
  }

  ///RETURN TypeOFOccupancy from json
  static TypeOfOccupancy fromJson(String json){
    Map map = jsonDecode(json);
    String id = map["id"];
    String type = map["type"];
    String sub_type = map["sub_type"];
    String description = map["description"];
    TypeOfOccupancy instance = TypeOfOccupancy(id, type, sub_type, description);
    return instance;
  }
}
