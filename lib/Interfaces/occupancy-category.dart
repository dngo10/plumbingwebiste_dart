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
}
