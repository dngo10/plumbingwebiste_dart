import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int ServiceSinkOtherFixureNeeded(TypeOfOccupancy typeOfOccupancy) {
    if(typeOfOccupancy.id == table422_1Ids.A1 ||
       typeOfOccupancy.id == table422_1Ids.A2 ||    
       typeOfOccupancy.id == table422_1Ids.A3 ||    
       typeOfOccupancy.id == table422_1Ids.A4 ||    
       typeOfOccupancy.id == table422_1Ids.A5 ||    
       typeOfOccupancy.id == table422_1Ids.B ||    
       typeOfOccupancy.id == table422_1Ids.E ||    
       typeOfOccupancy.id == table422_1Ids.F1 ||
       typeOfOccupancy.id == table422_1Ids.F2 ||    
       typeOfOccupancy.id == table422_1Ids.I1 ||    
       typeOfOccupancy.id == table422_1Ids.I2_1 ||
       typeOfOccupancy.id == table422_1Ids.I3_2 ||
       typeOfOccupancy.id == table422_1Ids.I4 ||
       typeOfOccupancy.id == table422_1Ids.M ||
       typeOfOccupancy.id == table422_1Ids.R1 ||
       typeOfOccupancy.id == table422_1Ids.R2_1 ||
       typeOfOccupancy.id == table422_1Ids.R2_2 ||
       typeOfOccupancy.id == table422_1Ids.R3_1 ||
       typeOfOccupancy.id == table422_1Ids.R4 ||
       typeOfOccupancy.id == table422_1Ids.S1 ||
       typeOfOccupancy.id == table422_1Ids.S2
    ){
        return 1;
    }
    return 0;
}

int LaundryOtherFixureNeeded(TypeOfOccupancy typeOfOccupancy) {
    if(typeOfOccupancy.id == table422_1Ids.A1 ||
       typeOfOccupancy.id == table422_1Ids.A2 ||    
       typeOfOccupancy.id == table422_1Ids.A3 ||    
       typeOfOccupancy.id == table422_1Ids.A4 ||    
       typeOfOccupancy.id == table422_1Ids.A5 ||    
       typeOfOccupancy.id == table422_1Ids.B ||    
       typeOfOccupancy.id == table422_1Ids.E ||    
       typeOfOccupancy.id == table422_1Ids.F1 ||
       typeOfOccupancy.id == table422_1Ids.F2 ||    
       typeOfOccupancy.id == table422_1Ids.I1 ||    
       typeOfOccupancy.id == table422_1Ids.I2_1 ||
       typeOfOccupancy.id == table422_1Ids.I3_2 ||
       typeOfOccupancy.id == table422_1Ids.I4 ||
       typeOfOccupancy.id == table422_1Ids.M ||
       typeOfOccupancy.id == table422_1Ids.R1 ||
       typeOfOccupancy.id == table422_1Ids.R2_1 ||
       typeOfOccupancy.id == table422_1Ids.R2_2 ||
       typeOfOccupancy.id == table422_1Ids.R2_3 ||
       typeOfOccupancy.id == table422_1Ids.R3_1 ||
       typeOfOccupancy.id == table422_1Ids.R4 ||
       typeOfOccupancy.id == table422_1Ids.S1 ||
       typeOfOccupancy.id == table422_1Ids.S2
    ){
        return 1;
    }
    return 0;
}

int Kitchensink_ApartmentOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
        return numOfApartment.ceil();
    } 
    return 0;
}

int Laundrytray_ApartmentOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
        return numOfApartment.ceil();
    } 
    return 0;
}

int ClothesWasherConnection_ApartmentOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
  if(typeOfOccupancy.id == table422_1Ids.R2_3){
    return numOfApartment.ceil();
  }
  return 0;
}

int Laundrytray_ApartmentOtherFixtureNeededOp2(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
        return (numOfApartment/12).ceil();
    } 
    return 0;
}

int AutomaticClothesWasher_ApartmentOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
      return (numOfApartment/12).ceil();
    } 
    return 0;
}

int Kitchensink_FamilyDwellingOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfFamilyDwelling){
  if(typeOfOccupancy.id == table422_1Ids.R3_2){
    return (numOfFamilyDwelling/2.0).ceil();
  }
  return 0;
}

int LaundryStray_ApartmentOtherFixtureNeeded(TypeOfOccupancy typeOfOccupancy, double numOApartment){
  if(typeOfOccupancy.id == table422_1Ids.R2_3){
    return numOfApartment.ceil();
  }
  return 0;
}
    
    
int Multiple2OtherFixureNeeded(TypeOfOccupancy typeOfOccupancy, double numOfFamilyDwelling){
    if(typeOfOccupancy.id == table422_1Ids.R3_2){
        return (numOfFamilyDwelling/2.0).ceil();
    } 
    return 0;
}