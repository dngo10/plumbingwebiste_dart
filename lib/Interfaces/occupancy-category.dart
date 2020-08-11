import 'table422_1Units.dart';

class TypeOfOccupancy {
  table422_1Ids id;
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
}
