import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int MaleWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double maleNumber){

    if(typeOfOccupancy.id == Table422_1Ids.A1 ||
       typeOfOccupancy.id == Table422_1Ids.A3 ||
       typeOfOccupancy.id == Table422_1Ids.A4 ||
       typeOfOccupancy.id == Table422_1Ids.A5 ||
       typeOfOccupancy.id == Table422_1Ids.M  ||
       typeOfOccupancy.id == Table422_1Ids.S1 ||
       typeOfOccupancy.id == Table422_1Ids.S2){
        if(1 <= maleNumber && maleNumber <= 100) return 1;
        else if(101 <= maleNumber && maleNumber <= 200) return 2;
        else if(201 <= maleNumber && maleNumber <= 400) return 3;
        else if(maleNumber > 400){
            return 3 + ((maleNumber-400)/ 500.0).ceil();
        }
    }
    else if(typeOfOccupancy.id == Table422_1Ids.A2){
        if(1 <= maleNumber && maleNumber <= 50) return 1;
        else if(51 <= maleNumber && maleNumber <= 100) return 2;
        else if(101 <= maleNumber && maleNumber <= 200) return 3;
        else if(201 <= maleNumber && maleNumber <= 400) return 4;
        else if(maleNumber > 400){
            return 4 + ((maleNumber - 400) / 250.0).ceil();
        }
    }
    else if(typeOfOccupancy.id == Table422_1Ids.B){
        if(1 <= maleNumber && maleNumber <= 50) return 1;
        else if(51 <= maleNumber && maleNumber <= 100) return 2;
        else if(101 <= maleNumber && maleNumber <= 200) return 3;
        else if(201 <= maleNumber && maleNumber <= 400) return 4;
        else if(maleNumber > 400){
            return 4 + ((maleNumber - 400) / 500.0).ceil();
        }
    }else if(typeOfOccupancy.id == Table422_1Ids.E){
        return (maleNumber/50.0).ceil();
    } else if(typeOfOccupancy.id == Table422_1Ids.F1 ||
              typeOfOccupancy.id == Table422_1Ids.F2){
        if(1 <= maleNumber && maleNumber <= 50) return 1;
        else if(51 <= maleNumber && maleNumber <= 75) return 2;
        else if(76 <= maleNumber && maleNumber <= 100) return 3;
        else if(maleNumber > 100){
            return 3 + ((maleNumber-100) / 40.0).ceil();
        }
    } else if(typeOfOccupancy.id == Table422_1Ids.I1){
        return (maleNumber/15.0).ceil();
    } else if(typeOfOccupancy.id == Table422_1Ids.I3_3 ||
              typeOfOccupancy.id == Table422_1Ids.I4 ||
              typeOfOccupancy.id == Table422_1Ids.R2_2 ||
              typeOfOccupancy.id == Table422_1Ids.I2_3 ){
        if(1 <= maleNumber && maleNumber <= 15) return 1;
        else if (16 <= maleNumber && maleNumber <= 35) return 2;
        else if (36 <= maleNumber && maleNumber <= 55) return 3;
        else if(maleNumber > 55){
            return 3 + ((maleNumber-55)/ 40.0).ceil();
        }
    } else if(typeOfOccupancy.id == Table422_1Ids.R2_1 ||
              typeOfOccupancy.id == Table422_1Ids.R3_1 ||
              typeOfOccupancy.id == Table422_1Ids.R4){
        if(1 <= maleNumber && maleNumber <= 10) return 1;
        else if(11 <= maleNumber && maleNumber <= 20) return 2;
        else if(21 <= maleNumber && maleNumber <= 2) return 3;
        else if(maleNumber == 25) return 4;
        else if(maleNumber > 25){
            return 3 + ((maleNumber-25)/ 25.0).ceil();
        }
    } 

    return 0;
}

int FemaleWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfFemale){

    if( typeOfOccupancy.id == Table422_1Ids.A1 ||
        typeOfOccupancy.id == Table422_1Ids.A2 ||
        typeOfOccupancy.id == Table422_1Ids.A3 ||
        typeOfOccupancy.id == Table422_1Ids.A4 ||
        typeOfOccupancy.id == Table422_1Ids.A5 ){
         if(1 <= numOfFemale && numOfFemale <= 25) return 1;
         else if(26 <=  numOfFemale && numOfFemale <= 50) return 2;
         else if(51 <=  numOfFemale && numOfFemale <= 100) return 3;
         else if(101 <= numOfFemale && numOfFemale <= 200) return 4;
         else if(201 <= numOfFemale && numOfFemale <= 300) return 6;
         else if(301 <= numOfFemale && numOfFemale <= 400) return 8;
         else if(numOfFemale > 400){
             return 6 + ((numOfFemale-400)/ 500.0).ceil();
        }
    } else if(typeOfOccupancy.id == Table422_1Ids.B){
        if(1 <= numOfFemale && numOfFemale <= 15) return 1;
        else if(16 <= numOfFemale && numOfFemale <= 30) return 2;
        else if(31 <= numOfFemale && numOfFemale <= 50) return 3;
        else if(51 <= numOfFemale && numOfFemale <= 100) return 4;
        else if(101 <= numOfFemale && numOfFemale <= 200) return 8;
        else if(201 <= numOfFemale && numOfFemale <= 400) return 11;
        else if(numOfFemale > 400) return  11 + ((numOfFemale-400)/150.0).ceil();
    } else if(typeOfOccupancy.id == Table422_1Ids.E){
        return (numOfFemale/30.0).ceil();
    } else if(typeOfOccupancy.id == Table422_1Ids.F1 ||
              typeOfOccupancy.id == Table422_1Ids.F2){ 
        return MaleWaterClosetsCount(typeOfOccupancy, numOfFemale);
    } else if(typeOfOccupancy.id == Table422_1Ids.I1){ // I-1
        return MaleWaterClosetsCount(typeOfOccupancy, numOfFemale);
    } else if(typeOfOccupancy.id == Table422_1Ids.I2_3 ||
              typeOfOccupancy.id == Table422_1Ids.I3_3 ||
              typeOfOccupancy.id == Table422_1Ids.I4){
        return MaleWaterClosetsCount(typeOfOccupancy, numOfFemale);
    } else if(typeOfOccupancy.id == Table422_1Ids.M){
        if(1 <= numOfFemale && numOfFemale <= 100) return 1;
        else if(101 <= numOfFemale && numOfFemale <= 200) return 2;
        else if(201 <= numOfFemale && numOfFemale <= 300) return 4;
        else if(301 <= numOfFemale && numOfFemale <= 400) return 6;
        else if(numOfFemale > 400) return 6 + ((numOfFemale - 400)/200.0).ceil();
    } else if(typeOfOccupancy.id == Table422_1Ids.R2_1 ||
              typeOfOccupancy.id == Table422_1Ids.R3_1 ||
              typeOfOccupancy.id == Table422_1Ids.R4){
        if(1 <= numOfFemale && numOfFemale <= 8) return 1;
        else if(9 <= numOfFemale && numOfFemale <= 16) return 2;
        else if(17 <= numOfFemale && numOfFemale <= 19) return 3;
        else if(numOfFemale == 20) return 4;
        else if(numOfFemale >= 20){
            return 3 + ((numOfFemale-20)/20.0).ceil(); 
        }
    } else if(typeOfOccupancy.id == Table422_1Ids.S1 ||
              typeOfOccupancy.id == Table422_1Ids.S2){
        if(1 <= numOfFemale && numOfFemale <= 100) return 1;
        else if(101 <= numOfFemale && numOfFemale <= 200) return 2;
        else if(201 <= numOfFemale && numOfFemale <= 400) return 3;
        else if(numOfFemale > 400){
            return 3 + ((numOfFemale-400)/150.0).ceil();
        }
    }
    return 0;
}

int RoomWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfRoom){
    if(typeOfOccupancy.id == Table422_1Ids.I2_1 ||
       typeOfOccupancy.id == Table422_1Ids.I2_2){
        return numOfRoom.ceil();
    }
    return 0;
}

int PatientsWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfPatients){
    if(typeOfOccupancy.id == Table422_1Ids.I2_1){
        return (numOfPatients/8.0).ceil();
    }
    return 0;
}

int SleepingRoomWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfSleepingRoom){
    if(typeOfOccupancy.id == Table422_1Ids.R1){
        return numOfSleepingRoom.ceil();
    }
    return 0;
}

int ApartmentWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfApartment){
    if(typeOfOccupancy.id == Table422_1Ids.R2_3){
        return numOfApartment.ceil();
    }
    return 0;
}

int FamilyDwellingWaterClosetsCount(TypeOfOccupancy typeOfOccupancy, double numOfFamilyDwelling){
    if(typeOfOccupancy.id == Table422_1Ids.R3_2){
        return (numOfFamilyDwelling / 2.0).ceil();
    }
    return 0;
}

int CellWaterClosetCount(TypeOfOccupancy typeOfOccupancy, double numOfCell){
    if(typeOfOccupancy.id == Table422_1Ids.I3_1){
        return numOfCell.ceil();
    }
    return 0;
}

int PersonWaterClosetCount(TypeOfOccupancy typeOfOccupancy, double numOfPerson){
    if(typeOfOccupancy.id == Table422_1Ids.I3_2){
        return (numOfPerson/8.0).ceil();
    }
    return 0;
}

