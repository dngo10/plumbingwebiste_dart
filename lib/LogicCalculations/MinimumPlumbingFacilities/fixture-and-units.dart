import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/urinals-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/waterclosets-cal.dart';

import 'bathtubs-shower-cal.dart';
import 'drinking-fountain-cal.dart';
import 'lavatories-cal.dart';

class FixtureUnit {

    TypeOfOccupancy occupancy;

    // This is UNIT INPUT
    Map<PairEntry , double> unit;

    // This is UNIT OUTPUT
    Map<table422_1Categories, double> FixtureRequireds;
    
    //Employee
    FixtureUnit(TypeOfOccupancy occupancy) {
        this.occupancy = occupancy;
        this.unit = Map<PairEntry , double>();
        this.InitUnitMapAndAmmountMap();

        this.FixtureRequireds = Map<table422_1Categories, double>();

        table422_1CategoriesNames.forEach((key, value) {
          this.FixtureRequireds[key] = 0;
        });
    }

    InitUnitMapAndAmmountMap(){
        //Check which units a
        typeAndAllowance.forEach((key, value) {
          if(value.contains(this.occupancy.id)){
            this.unit[key] = 0;
          }
        });
    }

    Set<String> GetUnitsAllowanceStrings(){
        Set<String> ans = Set<String>();
        unit.keys.forEach((element) {
          ans.add(table422_1CategoriesNames[element]);
        });

        return ans;
    }

    Set<table422_1Units> GetUnitsAllowanceEnum(){
        Set<table422_1Units> ans = Set<table422_1Units>();
        unit.forEach((key, value) {
          ans.add(key.t2);
        });
        return ans;
    }

    Set<table422_1Units> GetUnitsByCategories(table422_1Categories tableCat){
        Set<table422_1Units> ans = Set<table422_1Units>();
        unit.keys.forEach((element) {
          if(element.t1 == tableCat){
            ans.add(element.t2);
          }
        });
        return ans;
    }

    int WaterclosetCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == table422_1Categories.waterClosets){
                if(key.t2 == table422_1Units.male){
                    ans += MaleWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.female){
                    ans += FemaleWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.cell){
                    ans += CellWaterClosetCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.apartment){
                    ans += ApartmentWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.familydwelling){
                    ans += FamilyDwellingWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.patient){
                    ans += PatientsWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.sleepingroom){
                    ans += SleepingRoomWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.person){
                    ans += PersonWaterClosetCount(this.occupancy, value);
                } else if(key.t2 == table422_1Units.room){
                    ans += RoomWaterClosetsCount(this.occupancy,value);
                }
            }          
        });

        return ans;
    }

    int UrinalsCal(){
        int ans = 0;
        unit.forEach((key, value) {
          if(key.t1 == table422_1Categories.urinals){
            if(key.t2 == table422_1Units.male){
              ans += MaleUrinalsCount(this.occupancy, value);
            }
          }
        });
        return ans;
    }

    int LavatoriesCal(){

        int ans = 0;
        unit.forEach((key, value) {
          if(key.t1 == table422_1Categories.lavatories){
              if(key.t2 == table422_1Units.male){
                  ans += MaleLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.female){
                  ans += FemaleLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.cell){
                  ans += CellLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.apartment){
                  ans += ApartmentLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.familydwelling){
                  ans += FamilyDwellingLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.patient){
                  ans += PatientsLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.sleepingroom){
                  ans += SleepingRoomLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.person){
                  ans += PersonLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == table422_1Units.room){
                  ans += RoomLavatoriesCount(this.occupancy,value);
              }
          }
        });

        return ans;
    }

    int BathTubShowersCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == table422_1Categories.bathtubsOrShowers){
                if(key.t2 == table422_1Units.apartment){
                    ans += ApartmentBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.familydwelling){
                    ans += DwellingBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.patient){
                    ans += PatientsBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.person){
                    ans += PersonBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.room){
                    ans += RoomsBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.sleepingroom){
                    ans += SleepingRoomBathTubShowerCounts(this.occupancy, value);
                }
            }          
        });

        return ans;       
    }

    int DrinkingFoutainsCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == table422_1Categories.drinkingFountains){
                if(key.t2 == table422_1Units.person){
                    ans += PersonDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.floor){
                    ans += FloorDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.floorOrcellBlock){
                    ans += CellBlockFloorDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.room){
                    ans += RoomsDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == table422_1Units.servicesinkkOrlaundrytray){
                    ans += ServiceAndLaundryDrinkingFountainsCounts(this.occupancy);
                }
            }          
        });
        return ans;
    }

    public OtherCal(): number{
        let ans: number = 0;
        for (const [k,v] of this.unit) {
            if(k[0] == table422_1Categories.other){
                if(k[1] == table422_1Units.servicesinkkOrlaundrytray){
                    ans += otherFixtures.ServiceSinkOrLaundryTrayOtherFixureNeeded(this.occupancy);
                } else if(k[1] == table422_1Units.otherMultiple1){
                    ans += otherFixtures.Multiple1OtherFixureNeeded(this.occupancy, v);
                } else if(k[1] == table422_1Units.otherMultiple2){
                    ans += otherFixtures.Multiple2OtherFixureNeeded(this.occupancy, v);
                }
            }
        }
        return ans;
    }

        Map<table422_1Categories, double> Recalculate(){
        this.FixtureRequireds[table422_1Categories.drinkingFountains] = DrinkingFoutainsCal;
        this.FixtureRequireds[table422_1Categories.bathtubsOrShowers] = BathTubShowersCal();
        this.FixtureRequireds[table422_1Categories.lavatories] = LavatoriesCal();
        this.FixtureRequireds[table422_1Categories.other] = OtherCal();
        this.FixtureRequireds[table422_1Categories.urinals] = UrinalsCal();
        this.FixtureRequireds[table422_1Categories.waterClosets] = WaterclosetCal();

        return this.FixtureRequireds;
    }
}