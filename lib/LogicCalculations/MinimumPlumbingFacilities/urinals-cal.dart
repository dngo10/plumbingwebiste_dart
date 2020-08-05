import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

int MaleUrinalsCount(TypeOfOccupancy typeOfOccupancy, double numOfMale) {
    if(typeOfOccupancy.id == table422_1Ids.A1 || 
       typeOfOccupancy.id == table422_1Ids.A2 || 
       typeOfOccupancy.id == table422_1Ids.A3 || 
       typeOfOccupancy.id == table422_1Ids.A4 || 
       typeOfOccupancy.id == table422_1Ids.A5 || 
       typeOfOccupancy.id == table422_1Ids.B ){
           if(1 <= numOfMale && numOfMale <= 200) return 1;
           else if(201 <= numOfMale && numOfMale <= 300) return 2;
           else if(301 <= numOfMale && numOfMale <= 400) return 3;
           else if(401 <= numOfMale && numOfMale <= 600) return 4;
           else if(numOfMale > 600){
               return 4 + ((numOfMale - 600)/ 300.0).ceil();
           }
    }else if(typeOfOccupancy.id == table422_1Ids.E){
        return (numOfMale/100.0).ceil();
    }else if(typeOfOccupancy.id == table422_1Ids.I1){
        return (numOfMale/15).ceil();
    }else if(typeOfOccupancy.id == table422_1Ids.M){
        if(1 <= numOfMale && numOfMale <= 200) return 0;
        else if(201 <= numOfMale && numOfMale <= 400) return 400;
        else if(numOfMale > 400) return 1 + ((numOfMale-400)/500.0).ceil();
    } else if(typeOfOccupancy.id == table422_1Ids.R2_1){
        if(1 <= numOfMale && numOfMale <= 150){
            return (numOfMale/25.0).ceil();
        }else if(numOfMale > 150){
            return 6 + ((numOfMale-150)/50.0).ceil();
        } 
    }
    return 0;
}