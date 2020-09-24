//
/**
 * [HCD 1] For limited density owner-built rural dwelling sanitary facilities,
 * the type, design and number of facilities as required and approved by the local
 * health official shall be provided to the dwelling sites. It shall not be required that such facilities be located within the dwelling.
 */

import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int PersonDrinkingFountainsCounts(TypeOfOccupancy typeOfOccupancy, double numOfPerson) {
    if(typeOfOccupancy.id == Table422_1Ids.A1 ||
       typeOfOccupancy.id == Table422_1Ids.A2 ||
       typeOfOccupancy.id == Table422_1Ids.A3 ||
       typeOfOccupancy.id == Table422_1Ids.A4 ||
       typeOfOccupancy.id == Table422_1Ids.A5 ||
       typeOfOccupancy.id == Table422_1Ids.F1 ||
       typeOfOccupancy.id == Table422_1Ids.F2 ||
       typeOfOccupancy.id == Table422_1Ids.M  ||
       typeOfOccupancy.id == Table422_1Ids.S1 ||
       typeOfOccupancy.id == Table422_1Ids.S2
    ){
        if(1 <= numOfPerson && numOfPerson <= 250) return 1;
        else if(251 <= numOfPerson && numOfPerson <= 500) return 2;
        else if(501 <= numOfPerson && numOfPerson <= 750) return 3;
        else if(numOfPerson > 500){
            return 3 + ((numOfPerson-750)/ 500.0).ceil();
        }
    } else if(typeOfOccupancy.id == Table422_1Ids.B ||
              typeOfOccupancy.id == Table422_1Ids.E ||
              typeOfOccupancy.id == Table422_1Ids.I1 ||
              typeOfOccupancy.id == Table422_1Ids.I2_1 ||
              typeOfOccupancy.id == Table422_1Ids.I3_3 ||
              typeOfOccupancy.id == Table422_1Ids.I4 ||
              typeOfOccupancy.id == Table422_1Ids.R2_1 ||
              typeOfOccupancy.id == Table422_1Ids.R3_1 ||
              typeOfOccupancy.id == Table422_1Ids.R4
    ){
        return (numOfPerson/150.0).ceil();
    }
    return 0;
}

int CellBlockFloorDrinkingFountainsCounts(TypeOfOccupancy typeOfOccupancy , double numOfCellBLockFloor){
    if(typeOfOccupancy.id == Table422_1Ids.I3_1){
        return numOfCellBLockFloor.ceil();
    }
    return 0;
}

int RoomsDrinkingFountainsCounts(TypeOfOccupancy typeOfOccupancy, double numOfRooms){
    if(typeOfOccupancy.id == Table422_1Ids.I2_2 ){
        return numOfRooms.ceil();
    }
    return 0;
}

int FloorDrinkingFountainsCounts(TypeOfOccupancy typeOfOccupancy, double numOfFloor){
    if(typeOfOccupancy.id == Table422_1Ids.I3_2){
        return numOfFloor.ceil();
    }
    return 0;
}

