import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int Apartment_AutomaticClothesWasherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
      return (numOfApartment).ceil();
    } 
    return 0;
}

int Apartment_Big_AutomaticClothesWasherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment, int optionChoice){
    if(typeOfOccupancy.id == table422_1Ids.R2_3 && optionChoice == 3){
      return (numOfApartment/12).ceil();
    } 
    return 0;
}

int FamilyDwelling_AutomaticClothesWasherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfFamilyDwelling){
  if(typeOfOccupancy.id == table422_1Ids.R3_2){
    return (numOfFamilyDwelling/2.0).ceil();
  }
  return 0;
}
