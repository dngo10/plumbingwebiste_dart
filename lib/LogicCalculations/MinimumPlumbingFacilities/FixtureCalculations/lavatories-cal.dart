import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int MaleLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfMale){
    if(typeOfOccupancy.id == table422_1Ids.A1 ||
       typeOfOccupancy.id == table422_1Ids.A3
        ){
        if(1 <= numOfMale && numOfMale <= 200) return 1;
        else if(201 <= numOfMale && numOfMale <= 400) return 2;
        else if(401 <= numOfMale && numOfMale <= 600) return 3;
        else if(601 <= numOfMale && numOfMale <= 750) return 4;
        else if(numOfMale > 750){
            return 4 + ((numOfMale - 750)/250.0).ceil();
        }
        return 0;
    }else if(typeOfOccupancy.id == table422_1Ids.A2){
        if(1 <= numOfMale && numOfMale <= 150) return 1;
        else if(151 <= numOfMale && numOfMale <= 200) return 2;
        else if(201 <= numOfMale && numOfMale <= 400) return 3;
        else if(numOfMale > 400){
            return 3 + ((numOfMale - 400)/ 250.0).ceil();
        } 
    }else if(typeOfOccupancy.id == table422_1Ids.A4 ||
             typeOfOccupancy.id == table422_1Ids.A5
        ){ 
        if(1 <= numOfMale  && numOfMale <= 200) return 1;
        else if(201 <= numOfMale && numOfMale <= 400) return 2;
        else if(401 <= numOfMale && numOfMale <= 600) return 3;
        else if(numOfMale > 600){
            return 3 + ((numOfMale- 600)/250.0).ceil();
        }
    }else if(typeOfOccupancy.id == table422_1Ids.B){
        if(1 <= numOfMale && numOfMale <= 75) return 1;
        else if(76 <= numOfMale && numOfMale <= 150) return 2;
        else if(151 <= numOfMale && numOfMale <= 200) return 3;
        else if(201 <= numOfMale && numOfMale <= 300) return 4;
        else if(301 <= numOfMale && numOfMale <= 400) return 5;
        else if(numOfMale > 400){
            return 5 + ((numOfMale-400)/250.0).ceil();
        }
    }else if(typeOfOccupancy.id == table422_1Ids.E ||
             typeOfOccupancy.id == table422_1Ids.I2_3||
             typeOfOccupancy.id == table422_1Ids.I3_3||
             typeOfOccupancy.id == table422_1Ids.I4||
             typeOfOccupancy.id == table422_1Ids.R2_2 
             ){ 
        return (numOfMale/40.0).ceil();
    }else if(typeOfOccupancy.id == table422_1Ids.F1 ||
             typeOfOccupancy.id == table422_1Ids.F2){
        if(1 <= numOfMale && numOfMale <= 50) return 1;
        else if(51 <= numOfMale && numOfMale <= 75) return 2;
        else if(76 <= numOfMale && numOfMale <= 100) return 3;
        else if(numOfMale > 100){
            return ((numOfMale - 100)/ 40.0).ceil();
        }
    }else if(typeOfOccupancy.id == table422_1Ids.I1){ // I-1
        return (numOfMale / 15.0).ceil();
    }else if(typeOfOccupancy.id == table422_1Ids.M){ // M
        if(1 <= numOfMale && numOfMale <= 200) return 1;
        else if(201 <= numOfMale && numOfMale <= 400) return 2;
        else if(numOfMale > 400){
            return 2 + ((numOfMale-400)/ 500.0).ceil();
        }
    //This MUST BE CHECKED AGAIN, the logic is UNCLEAR
    }else if(typeOfOccupancy.id == table422_1Ids.R2_1 ||
             typeOfOccupancy.id == table422_1Ids.R3_1 ||
             typeOfOccupancy.id == table422_1Ids.R4
        ){
        if(1 <= numOfMale && numOfMale <= 12) return 1;
        else if(13 <= numOfMale && numOfMale <= 19) return 2;
        else if(numOfMale == 20) return 3;
        else if(numOfMale >= 20){
            return 2 + ((numOfMale-20)/ 20.0).ceil();
        }
    }  else if(typeOfOccupancy.id == table422_1Ids.S1 ||
               typeOfOccupancy.id == table422_1Ids.S2 ){
        if(1 <= numOfMale && numOfMale <= 200) return 1;
        else if(201 <= numOfMale && numOfMale <= 400) return 2;
        else if(401 <= numOfMale && numOfMale <= 750) return 3;
        else if(numOfMale > 750){
            return 3 + ((numOfMale-750)/ 500.0).ceil();
        }
    }
    return 0;
}

int FemaleLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfFemale){
    if(typeOfOccupancy.id == table422_1Ids.A1 ||
       typeOfOccupancy.id == table422_1Ids.A3 ||
       typeOfOccupancy.id == table422_1Ids.A4 ||
       typeOfOccupancy.id == table422_1Ids.A5
        ){
        if(1 <= numOfFemale && numOfFemale <= 100) return 1;
        else if(101 <= numOfFemale && numOfFemale <= 200) return 2;
        else if(201 <= numOfFemale && numOfFemale <= 300) return 3;
        else if(301 <= numOfFemale && numOfFemale <= 500) return 5;
        else if(501 <= numOfFemale && numOfFemale <= 750) return 6;
        else if(numOfFemale >= 750){
            return 6 + ((numOfFemale - 750)/ 200.0).ceil();
        }
    } else if(typeOfOccupancy.id == table422_1Ids.A2
        ){
        if(1 <= numOfFemale && numOfFemale <= 150) return 1;
        else if(151 <= numOfFemale && numOfFemale <= 200) return 2;
        else if(201 <= numOfFemale && numOfFemale <= 400) return 4;
        else if(numOfFemale >= 400){
            return 4 + ((numOfFemale - 400) / 200.0).ceil();
        }
    } else if(typeOfOccupancy.id ==  table422_1Ids.B){
        if(1 <= numOfFemale && numOfFemale <= 50) return 1;
        else if(51 <= numOfFemale && numOfFemale <= 100) return 2;
        else if(101 <= numOfFemale && numOfFemale <= 150) return 3;
        else if(151 <= numOfFemale && numOfFemale <= 200) return 4;
        else if(201 <= numOfFemale && numOfFemale <= 300) return 5;
        else if(301 <= numOfFemale && numOfFemale <= 400) return 6;
        else if(numOfFemale > 400){
            return 6 + ((numOfFemale-400)/200.0).ceil();
        }
    } else if(typeOfOccupancy.id == table422_1Ids.E ||
              typeOfOccupancy.id == table422_1Ids.I2_3 || 
              typeOfOccupancy.id == table422_1Ids.I3_3 || 
              typeOfOccupancy.id == table422_1Ids.I4 || 
              typeOfOccupancy.id == table422_1Ids.R2_2
        ){
        return MaleLavatoriesCount(typeOfOccupancy, numOfFemale);
    } else if(typeOfOccupancy.id == table422_1Ids.F1 ||
              typeOfOccupancy.id == table422_1Ids.F2 ){
                return MaleLavatoriesCount(typeOfOccupancy, numOfFemale);
    } else if(typeOfOccupancy.id == table422_1Ids.I1){ // I-1
        return (numOfFemale/8.0).ceil(); //According to CPC 2019, older might different
    } else if(typeOfOccupancy.id == table422_1Ids.M){ // M
        if(1 <= numOfFemale && numOfFemale <= 200) return 1;
        else if(201 <= numOfFemale && numOfFemale <= 300) return 2;
        else if(301 <= numOfFemale && numOfFemale <= 400) return 3;
        else if(numOfFemale > 400){
            return 3 + ((numOfFemale-400)/ 400.0).ceil();
        }
    } else if(typeOfOccupancy.id == table422_1Ids.R2_1 || 
              typeOfOccupancy.id == table422_1Ids.R3_1 || 
              typeOfOccupancy.id == table422_1Ids.R4 
        ){
        if(1 <= numOfFemale && numOfFemale <= 12) return 1;
        else if(13 <= numOfFemale && numOfFemale <= 14) return 2;
        else if(numOfFemale == 15) return 3;
        else if(numOfFemale >= 15){
            return 2 + ((numOfFemale-15)/15.0).ceil();
        }
    } else if(typeOfOccupancy.id == table422_1Ids.S1 ||
              typeOfOccupancy.id == table422_1Ids.S2 ){
        return MaleLavatoriesCount(typeOfOccupancy, numOfFemale);
    }
    return 0;
}

int RoomLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfRoom){
    if(typeOfOccupancy.id == table422_1Ids.I2_1 ||
       typeOfOccupancy.id == table422_1Ids.I2_2){
        return numOfRoom.ceil();
    }
    return 0;
}

int PatientsLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfPatients){
    if(typeOfOccupancy.id == table422_1Ids.I2_1){
        return (numOfPatients/10.0).ceil();
    }
    return 0;
}

int SleepingRoomLavatoriesCount(TypeOfOccupancy typeOfOccupancy , double numOfSleepingRoom){
    if(typeOfOccupancy.id == table422_1Ids.R1){
        return numOfSleepingRoom.ceil();
    }
    return 0;
}

int ApartmentLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == table422_1Ids.R2_3){
        return numOfApartment.ceil();
    }
    return 0;
}

int FamilyDwellingLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfFamilyDwelling){
    if(typeOfOccupancy.id == table422_1Ids.R3_2){
        return (numOfFamilyDwelling / 2.0).ceil();
    }
    return 0;
}

int CellLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfCell){
    if(typeOfOccupancy.id == table422_1Ids.I3_1){
        return numOfCell.ceil();
    }
    return 0;
}

int PersonLavatoriesCount(TypeOfOccupancy typeOfOccupancy, double numOfPerson){
    if(typeOfOccupancy.id == table422_1Ids.I3_2){
        return (numOfPerson/10.0).ceil();
    }
    return 0;
}