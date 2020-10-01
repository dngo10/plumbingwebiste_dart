import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int None_ServiceSinkFixureNeeded(TypeOfOccupancy typeOfOccupancy, double unitNumber) {
    if(typeOfOccupancy.id == Table422_1Ids.A1 ||
       typeOfOccupancy.id == Table422_1Ids.A2 ||    
       typeOfOccupancy.id == Table422_1Ids.A3 ||    
       typeOfOccupancy.id == Table422_1Ids.A4 ||    
       typeOfOccupancy.id == Table422_1Ids.A5 ||    
       typeOfOccupancy.id == Table422_1Ids.B ||    
       typeOfOccupancy.id == Table422_1Ids.E ||    
       typeOfOccupancy.id == Table422_1Ids.F1 ||
       typeOfOccupancy.id == Table422_1Ids.F2 ||    
       typeOfOccupancy.id == Table422_1Ids.I1 ||    
       typeOfOccupancy.id == Table422_1Ids.I2_1 ||
       typeOfOccupancy.id == Table422_1Ids.I3_2 ||
       typeOfOccupancy.id == Table422_1Ids.I4 ||
       typeOfOccupancy.id == Table422_1Ids.M ||
       typeOfOccupancy.id == Table422_1Ids.R1 ||
       typeOfOccupancy.id == Table422_1Ids.R2_1 ||
       typeOfOccupancy.id == Table422_1Ids.R2_2 ||
       typeOfOccupancy.id == Table422_1Ids.R3_1 ||
       typeOfOccupancy.id == Table422_1Ids.R4 ||
       typeOfOccupancy.id == Table422_1Ids.S1 ||
       typeOfOccupancy.id == Table422_1Ids.S2
    ){
      return 1;
    }
    return 0;
}