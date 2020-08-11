import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/other-fixture-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/urinals-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/waterclosets-cal.dart';

import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/bathtubs-shower-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/drinking-fountain-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/lavatories-cal.dart';

class FixtureUnit {

    TypeOfOccupancy occupancy;

    ///PairEntry is: <table422_1Categories,table422_1Units>
    Map<PairEntry , double> unit;

    Map<table422_1Units, double> inputUnit;

    // This is UNIT OUTPUT
    Map<table422_1Categories, double> fixtureRequired;

    Map<table422_1Categories, double> get FixtureRequireds{
      return fixtureRequired;
    }

    void set FixtureRequireds(Map<table422_1Categories, double> item){
      fixtureRequired = item;
      Recalculate();
    }
    
    //Employee
    FixtureUnit(TypeOfOccupancy occupancy) {
        this.occupancy = occupancy;

        
        this.unit = Map<PairEntry , double>();
        this.inputUnit = Map<table422_1Units, double>();

        this._InitUnitMapAndAmmountMap();

        this.fixtureRequired = Map<table422_1Categories, double>();

        table422_1CategoriesNames.forEach((key, value) {
          this.fixtureRequired[key] = 0;
        });
    }

    FixtureUnit Clone(){
      FixtureUnit fixtureUnit = FixtureUnit(this.occupancy.clone());
      fixtureUnit.unit = Map<PairEntry, double>.from(this.unit);
      fixtureUnit.inputUnit = Map<table422_1Units, double>.from(this.inputUnit);
      fixtureUnit.fixtureRequired =  Map<table422_1Categories, double>.from(this.fixtureRequired);

      return fixtureUnit;
    }

    void Merge(FixtureUnit fixtureUnit){
      this.occupancy.Merge(fixtureUnit.occupancy);
      this.unit = fixtureUnit.unit;
      this.inputUnit = fixtureUnit.inputUnit;
      this.fixtureRequired = fixtureUnit.fixtureRequired;
    }

    _InitUnitMapAndAmmountMap(){
        //Check which units a
        typeAndAllowance.forEach((key, value) {
          if(value.contains(this.occupancy.id)){
            this.unit[key] = 0;
            inputUnit[key.t2] = 0;
          }
        });
    }

    bool IsAddable(){
      bool ans = false;
      fixtureRequired.forEach((key, value) {
        if(key != table422_1Categories.other){
          if(value > 0) {
            ans = true;
          }
        }
      });

      return ans;
    }

    Set<String> GetUnitsAllowanceStrings(){
        Set<String> ans = Set<String>();
        inputUnit.keys.forEach((element) {
          ans.add(table422_1Units_Names[element]);
        });
        return ans;
    }

    Set<table422_1Units> GetUnitsAllowanceEnum(){
        return inputUnit.keys.toSet();
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

    int _WaterclosetCal(){
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

    int _UrinalsCal(){
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

    int _LavatoriesCal(){

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

    int _BathTubShowersCal(){
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

    int _DrinkingFoutainsCal(){
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

    int _OtherCal(){
        int ans = 0;

        unit.forEach((key, value) { 
          if(key.t1 == table422_1Categories.other){
              if(key.t2 == table422_1Units.servicesinkkOrlaundrytray){
                  ans += ServiceSinkOrLaundryTrayOtherFixureNeeded(this.occupancy);
              } else if(key.t2 == table422_1Units.otherMultiple1){
                  ans += Multiple1OtherFixureNeeded(this.occupancy, value);
              } else if(key.t2 == table422_1Units.otherMultiple2){
                  ans += Multiple2OtherFixureNeeded(this.occupancy, value);
              }
          }
        });
        return ans;
    }

    void _MergeInputValueToUnit(){
      inputUnit.forEach((keyI, valueI) {
        unit.forEach((keyU, valueU) {
          if(keyU.t2 == keyI){
            unit[keyU] = valueI;
          }
        });
      });
    }

    Map<table422_1Categories, double> Recalculate(){
      _MergeInputValueToUnit();
        this.fixtureRequired[table422_1Categories.drinkingFountains] = _DrinkingFoutainsCal().toDouble();
        this.fixtureRequired[table422_1Categories.bathtubsOrShowers] = _BathTubShowersCal().toDouble();
        this.fixtureRequired[table422_1Categories.lavatories] = _LavatoriesCal().toDouble();
        this.fixtureRequired[table422_1Categories.other] = _OtherCal().toDouble();
        this.fixtureRequired[table422_1Categories.urinals] = _UrinalsCal().toDouble();
        this.fixtureRequired[table422_1Categories.waterClosets] = _WaterclosetCal().toDouble();

        return this.fixtureRequired; 
    }


}