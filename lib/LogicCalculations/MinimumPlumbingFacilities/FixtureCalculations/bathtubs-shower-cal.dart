import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int PersonBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy, double numOfPerson){
    if(typeOfOccupancy.id == table422_1Ids.F1 ||
       typeOfOccupancy.id == table422_1Ids.F2){
        return (numOfPerson/15.0).ceil();
        //For persons exposed to excessive heat or to skin contamination with poisonous, infectious or irritating material.
    } else if(typeOfOccupancy.id == table422_1Ids.I1){
        return (numOfPerson/150.0).ceil();
    } else if(typeOfOccupancy.id == table422_1Ids.I3_1){
        return (numOfPerson/20.0).ceil();
    } else if(typeOfOccupancy.id == table422_1Ids.I3_2 ||
              typeOfOccupancy.id == table422_1Ids.R2_1 ||
              typeOfOccupancy.id == table422_1Ids.R3_1 ||
              typeOfOccupancy.id == table422_1Ids.R4
        ){
        return (numOfPerson/8.0).ceil();
    }
    return 0;
}

int RoomsBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy , double numOfRoom){
    if(typeOfOccupancy.id == table422_1Ids.I2_1){
        return numOfRoom.ceil();
    }
    return 0;
}

int SleepingRoomBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy, double numOfSleepingRoom){
    if(typeOfOccupancy.id == table422_1Ids.R1){
        return numOfSleepingRoom.ceil();
    }
    return 0;
}

int ApartmentBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
        return numOfApartment.ceil();
    }
    return 0;
}

int DwellingBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy, double numOfDwelling){
    if(typeOfOccupancy.id == table422_1Ids.R3_2){
        return (numOfDwelling/2.0).ceil();
    }
    return 0;
}

int PatientsBathTubShowerCounts(TypeOfOccupancy typeOfOccupancy, double numOfPatient){
    if(typeOfOccupancy.id == table422_1Ids.I2_1){
        return (numOfPatient/20.0).ceil();
    }
    return 0;
}