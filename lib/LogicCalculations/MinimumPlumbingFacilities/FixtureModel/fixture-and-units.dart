import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/urinals-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/waterclosets-cal.dart';

import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/bathtubs-shower-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/drinking-fountain-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/lavatories-cal.dart';

class FixtureUnit {

    TypeOfOccupancy occupancy;

    ///PairEntry is: <table422_1Categories,table422_1Units>
    Map<PairEntry , double> unit;

    Map<table422_1Units, double> inputUnits;
    Map<table422_1Categories, double> outputUnits;

    //Map<table422_1Categories, String> _catMap = table422_1CategoriesNames;
    //Map<table422_1Categories, String> _urlMap =  fixtureIconUrl;
    //Map<table422_1Units, String> _unitMap = table422_1Units_Names;



    FixtureUnit(TypeOfOccupancy occupancy) {
        this.occupancy = occupancy.clone();

        this.unit = Map<PairEntry , double>();
        this.inputUnits = Map<table422_1Units, double>();
        this.outputUnits = Map<table422_1Categories, double>();

        this._InitUnitMapAndAmmountMap();

        GetUnitsAllowanceEnum();
    }

    FixtureUnit.Void(){ 
        this.unit = Map<PairEntry , double>();
        this.inputUnits = Map<table422_1Units, double>();
        this.outputUnits = Map<table422_1Categories, double>();

        this._InitUnitMapAndAmmountMap();
    }

    FixtureUnit clone(){
      
      FixtureUnit fixtureUnit = FixtureUnit(this.occupancy.clone());
      fixtureUnit.unit = Map<PairEntry, double>.from(this.unit);
      fixtureUnit.inputUnits = Map<table422_1Units, double>.from(this.inputUnits);
      fixtureUnit.outputUnits = Map<table422_1Categories, double>.from(this.outputUnits);

      return fixtureUnit;
    }

    //MERGE AND CLONE looks similar, but they are SUPER DIFFERENT
    void Merge(FixtureUnit fixtureUnit){
      if(occupancy == null) return;

      this.occupancy.Merge(fixtureUnit.occupancy);
      this.unit = Map<PairEntry, double>.from(fixtureUnit.unit);
      this.inputUnits = Map<table422_1Units,double>.from(fixtureUnit.inputUnits);
      this.outputUnits = Map<table422_1Categories, double>.from(fixtureUnit.outputUnits);
    }

    _InitUnitMapAndAmmountMap(){
        if(occupancy == null) return;
        //Check which units a
        typeAndAllowance.forEach((key, value) {
          if(value.contains(this.occupancy.id)){
            this.unit[key] = 0;
            if(OutputSet.contains(key.t1)){
              this.outputUnits[key.t1] = 0;
            }
            if(InputSet.contains(key.t2)){
              this.inputUnits[key.t2] = 0;
            }    
          }
        });
    }

    bool IsAddable(){
      bool ans = false;
      outputUnits.forEach((key, value) {
        if(!OtherSet.contains(key)){
          if(value > 0) {
            ans = true;
          }
        }
      });
      return ans;
    }

    Set<table422_1Units> GetUnitsAllowanceEnum(){
        return inputUnit.keys.toSet();
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
                }
            }          
        });
        return ans;
    }

    int _OtherCal(){
        int ans = 0;

        unit.forEach((key, value) { 
          if(key.t1 == table422_1Categories.other){
              if(key.t2 == table422_1Units.servicesink){
                  ans += ServiceSinkOtherFixureNeeded(this.occupancy);
              }else if(key.t2 == table422_1Units.laundrytray){
                  ans += LaundryOtherFixureNeeded(this.occupancy);
                  ans += Laundrytray_ApartmentOtherFixtureNeeded(this.occupancy, value);
                  ans += Laundrytray_ApartmentOtherFixtureNeededOp2(this.occupancy, value);
              }else if(key.t2 == table422_1Units.kitchensink){
                  ans += Kitchensink_ApartmentOtherFixtureNeeded(this.occupancy, value);
                  ans += Kitchensink_FamilyDwellingOtherFixtureNeeded(this.occupancy, value);
              }else if(key.t2 == table422_1Units.automaticclotheswasherconnection){
                  ans += AutomaticClothesWasher_ApartmentOtherFixtureNeeded(this.occupancy, value);
                  ans += AutomaticClothesWasher_FamilyDwellingOtherFixtureNeeded(this.occupancy, value);
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
        this._fixtureRequired[table422_1Categories.drinkingFountains] = _DrinkingFoutainsCal().toDouble();
        this._fixtureRequired[table422_1Categories.bathtubsOrShowers] = _BathTubShowersCal().toDouble();
        this._fixtureRequired[table422_1Categories.lavatories] = _LavatoriesCal().toDouble();
        this._fixtureRequired[table422_1Categories.other] = _OtherCal().toDouble();
        this._fixtureRequired[table422_1Categories.urinals] = _UrinalsCal().toDouble();
        this._fixtureRequired[table422_1Categories.waterClosets] = _WaterclosetCal().toDouble();
        return this._fixtureRequired; 
    }
}