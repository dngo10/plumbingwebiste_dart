import 'dart:convert';

import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/automatic-clothes-washer-connection-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/kitchen-sink-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/laundry-tray-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/service-sink.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/urinals-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/waterclosets-cal.dart';

import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/bathtubs-shower-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/drinking-fountain-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/lavatories-cal.dart';


class FixtureUnit {

    TypeOfOccupancy occupancy;

    ///PairEntry is: <table422_1Categories,table422_1Units>
    Map<PairEntry , double> unit;
    Map<String, double> inputUnits;
    Map<String, double> outputUnits;

    //Other fixture options
    int _choiceOption;
    ///String here is from Table422_1Categories
    List<List<String>> otherOptions;

    int get choiceOption => _choiceOption;

    void set choiceOption(int value){
      if(value == _choiceOption){
        return;
      }else{
        _choiceOption = value;
        Recalculate();
      }
    }

    bool HasOtherFixture(){
      if(otherOptions == null || otherOptions.length == 0){
        return false;
      }
      if(choiceOption == -1){
        return false;
      }
    return true;
  }

  void _outPutsReset(){
    unit.forEach((key, value) {
      unit[key] = 0;
    });

    outputUnits.forEach((key, value) {
      outputUnits[key] = 0;
    });
  }

    FixtureUnit(TypeOfOccupancy occupancy) {
        this.occupancy = occupancy.clone();

        this.unit = Map<PairEntry , double>();
        ///Map<Table422_1Units, double>
        this.inputUnits = Map<String, double>();
        ///Map<Table422_1Categories, double>
        this.outputUnits = Map<String, double>();

        this._InitUnitMapAndAmmountMap();
        this._GetOtherCheckOptions();
    }

    FixtureUnit.Void(){ 
        this.unit = Map<PairEntry , double>();

        this.inputUnits = Map<String, double>();
        this.outputUnits = Map<String, double>();

        this._InitUnitMapAndAmmountMap();
        this._GetOtherCheckOptions();
    }
    FixtureUnit clone(){
      
      FixtureUnit fixtureUnit = FixtureUnit(this.occupancy.clone());
      fixtureUnit.unit = Map<PairEntry, double>.from(this.unit);
      fixtureUnit.inputUnits = Map<String, double>.from(this.inputUnits);
      fixtureUnit.outputUnits = Map<String, double>.from(this.outputUnits);
      fixtureUnit.choiceOption = choiceOption;

      return fixtureUnit;
    }


    /// This is to get the options for Other Categories.
    void _GetOtherCheckOptions(){
      if(occupancy != null){
        if(otherOptions == null){
          ///List<List<Table422_1Cateogories>>
          otherOptions = List<List<String>>();
        }else{
          otherOptions.clear();
        }

        if(occupancy.id == Table422_1Ids.R2_3){
          otherOptions = otherCheckSet[ComboOthers.r2_3];
          _choiceOption = 0;
        } else if(occupancy.id == Table422_1Ids.R3_2){
          otherOptions = otherCheckSet[ComboOthers.r2_3];
        } else if(occupancy.id == Table422_1Ids.I2_2 ||
                  occupancy.id == Table422_1Ids.I2_3 ||
                  occupancy.id == Table422_1Ids.I3_1 ||
                  occupancy.id == Table422_1Ids.I3_3
        ){
          otherOptions = List<List<String>>();
          _choiceOption = -1;
          //This means the otherOptions is empty
        } else{
          otherOptions = otherCheckSet[ComboOthers.common];
          _choiceOption = 0;
        }
      }
    }

    //MERGE AND CLONE looks similar, but they are SUPER DIFFERENT
    void Merge(FixtureUnit fixtureUnit){
      if(occupancy == null) return;

      this.occupancy.Merge(fixtureUnit.occupancy);
      this.unit = Map<PairEntry, double>.from(fixtureUnit.unit);
      this.inputUnits = Map<String,double>.from(fixtureUnit.inputUnits);
      this.outputUnits = Map<String, double>.from(fixtureUnit.outputUnits);
    }

    _InitUnitMapAndAmmountMap(){
        if(occupancy == null) return;
        typeAndAllowance.forEach((key, value) {
          if(value.contains(this.occupancy.id)){
            this.unit[key] = 0;
            if(Table422_1Categories.OutputSet.contains(key.t1)){
              this.outputUnits[key.t1] = 0;
            }
            if(Table422_1Units.InputSet.contains(key.t2)){
              this.inputUnits[key.t2] = 0;
            }    
          }
        });
    }

    bool IsAddable(){
      bool ans = false;
      outputUnits.forEach((key, value) {
        if(!Table422_1Categories.OtherSet.contains(key)){
          if(value > 0) {
            ans = true;
          }
        }
      });
      return ans;
    }

    Set<String> GetInputPutAllowedEnum(){
        return inputUnits.keys.toSet();
    }

    Set<String> GetOutputAllowedEnum(){
        return outputUnits.keys.toSet();
    } 

    int _WaterclosetCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == Table422_1Categories.waterClosets){
                if(key.t2 == Table422_1Units.male){
                    ans += MaleWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.female){
                    ans += FemaleWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.cell){
                    ans += CellWaterClosetCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.apartment){
                    ans += ApartmentWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.familydwelling){
                    ans += FamilyDwellingWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.patient){
                    ans += PatientsWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.sleepingroom){
                    ans += SleepingRoomWaterClosetsCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.person){
                    ans += PersonWaterClosetCount(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.room){
                    ans += RoomWaterClosetsCount(this.occupancy,value);
                }
            }          
        });

        return ans;
    }

    int _UrinalsCal(){
        int ans = 0;
        unit.forEach((key, value) {
          if(key.t1 == Table422_1Categories.urinals){
            if(key.t2 == Table422_1Units.male){
              ans += MaleUrinalsCount(this.occupancy, value);
            }
          }
        });
        return ans;
    }

    int _LavatoriesCal(){

        int ans = 0;
        unit.forEach((key, value) {
          if(key.t1 == Table422_1Categories.lavatories){
              if(key.t2 == Table422_1Units.male){
                  ans += MaleLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.female){
                  ans += FemaleLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.cell){
                  ans += CellLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.apartment){
                  ans += ApartmentLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.familydwelling){
                  ans += FamilyDwellingLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.patient){
                  ans += PatientsLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.sleepingroom){
                  ans += SleepingRoomLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.person){
                  ans += PersonLavatoriesCount(this.occupancy, value);
              } else if(key.t2 == Table422_1Units.room){
                  ans += RoomLavatoriesCount(this.occupancy,value);
              }
          }
        });

        return ans;
    }

    int _BathTubShowersCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == Table422_1Categories.bathtubsOrShowers){
                if(key.t2 == Table422_1Units.apartment){
                    ans += ApartmentBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.familydwelling){
                    ans += DwellingBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.patient){
                    ans += PatientsBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.person){
                    ans += PersonBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.room){
                    ans += RoomsBathTubShowerCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.sleepingroom){
                    ans += SleepingRoomBathTubShowerCounts(this.occupancy, value);
                }
            }          
        });

        return ans;       
    }

    int _DrinkingFoutainsCal(){
        int ans = 0;

        unit.forEach((key, value) {
            if(key.t1 == Table422_1Categories.drinkingFountains){
                if(key.t2 == Table422_1Units.person){
                    ans += PersonDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.floor){
                    ans += FloorDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.floorOrcellBlock){
                    ans += CellBlockFloorDrinkingFountainsCounts(this.occupancy, value);
                } else if(key.t2 == Table422_1Units.room){
                    ans += RoomsDrinkingFountainsCounts(this.occupancy, value);
                }
            }          
        });
        return ans;
    }

    int _Laundry_tray_cal (){
        int ans = 0;

        unit.forEach((key, value) { 
          if(key.t1 == Table422_1Categories.laundrytray){
              if(key.t2 == Table422_1Units.none){
                  ans += None_LaundryTrayFixureNeeded(this.occupancy, value);
              }else if(key.t2 == Table422_1Units.apartment){
                     ans += Apartment_LaundryTrayFixtureNeeded(this.occupancy, value);
              }
          }
        });
        return ans;
    }

    int _Big_Laundry_tray_cal(){
      int ans = 0;
      unit.forEach((key, value) {
        if(key.t1 == Table422_1Categories.big_landrytray){
          ans += Apartment_Big_LaundryTrayFixtureNeeded(this.occupancy, value, choiceOption);
        }
      });
      return ans;
    }

    int _Big_Automatic_clothes_washer_connection_cal(){
      int ans = 0;
      unit.forEach((key, value) {
        if(key.t1 == Table422_1Categories.big_automaticclotheswasherconnection){
          ans += Apartment_Big_AutomaticClothesWasherFixtureNeeded(this.occupancy, value, choiceOption);
        }
      });
      return ans;
    }

    int _Automatic_clothes_washer_connection_cal(){
      int ans = 0;

      unit.forEach((key, value) {
        if(key.t1 == Table422_1Categories.automaticclotheswasherconnection){
          if(key.t2 == Table422_1Units.apartment){
            ans += Apartment_AutomaticClothesWasherFixtureNeeded(this.occupancy, value);
          } else if(key.t2 == Table422_1Units.familydwelling){
            ans += FamilyDwelling_AutomaticClothesWasherFixtureNeeded(this.occupancy, value);
          }
        }
      });
      return ans;
    }

    int _Service_sink_cal(){
      int ans = 0;

      unit.forEach((key, value){
        if(key.t1 == Table422_1Categories.servicesink){
          if(key.t2 == Table422_1Units.none){
            ans += None_ServiceSinkFixureNeeded(this.occupancy, value);
          }
        }
      });
      return ans;
    }

    int _Kitchen_sink_cal(){
      int ans = 0;

      unit.forEach((key, value) {
        if(key.t1 == Table422_1Categories.kitchensink){
          if(key.t2 == Table422_1Units.apartment){
            ans += Apartment_KitchenSinkFixtureNeeded(this.occupancy, value);
          }
        }
      });

      return ans;
    }

    void _MergeInputValueToUnit(){
      inputUnits.forEach((keyI, valueI) {
        unit.forEach((keyU, valueU) {
          if(keyU.t2 == keyI && outputUnits.containsKey(keyU.t1)){
            unit[keyU] = valueI;
          }
        });
      });
    }

    Map<String, double> Recalculate(){
      _outPutsReset();
      _MergeInputValueToUnit();
      if(outputUnits.containsKey(Table422_1Categories.drinkingFountains)) this.outputUnits[Table422_1Categories.drinkingFountains] = _DrinkingFoutainsCal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.bathtubsOrShowers)) this.outputUnits[Table422_1Categories.bathtubsOrShowers] = _BathTubShowersCal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.lavatories)) this.outputUnits[Table422_1Categories.lavatories] = _LavatoriesCal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.urinals)) this.outputUnits[Table422_1Categories.urinals] = _UrinalsCal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.waterClosets)) this.outputUnits[Table422_1Categories.waterClosets] = _WaterclosetCal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.automaticclotheswasherconnection) && _hasOtherFixture(Table422_1Categories.automaticclotheswasherconnection))
        this.outputUnits[Table422_1Categories.automaticclotheswasherconnection] = _Automatic_clothes_washer_connection_cal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.kitchensink) && _hasOtherFixture(Table422_1Categories.kitchensink))
        this.outputUnits[Table422_1Categories.kitchensink] = _Kitchen_sink_cal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.servicesink) && _hasOtherFixture(Table422_1Categories.servicesink))
        this.outputUnits[Table422_1Categories.servicesink] = _Service_sink_cal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.laundrytray) && _hasOtherFixture(Table422_1Categories.laundrytray))
        this.outputUnits[Table422_1Categories.laundrytray] = _Laundry_tray_cal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.big_landrytray))
        this.outputUnits[Table422_1Categories.big_landrytray] = _Big_Laundry_tray_cal().toDouble();
      if(outputUnits.containsKey(Table422_1Categories.big_automaticclotheswasherconnection))
        this.outputUnits[Table422_1Categories.big_automaticclotheswasherconnection] = _Big_Automatic_clothes_washer_connection_cal().toDouble();

      //print(this.outputUnits);
      return this.outputUnits;
    }

    bool _hasOtherFixture(String cat){
      if(otherOptions == null || otherOptions.length == 0) return false;
      if(choiceOption == null || choiceOption == -1) return false;
      if(otherOptions[choiceOption].contains(cat)){
        return true;
      }
      outputUnits[cat] = 0;
      return false;
    }

    String toJson(){
      Map<String,double> unitStr = Map<String,double>();
      unit.forEach((key, value) {
         unitStr[key.toString()] = value;
      });
      Map map = {
        "unit" : jsonEncode(unitStr),
        "inputUnits": jsonEncode(inputUnits),
        "outputUnits": jsonEncode(outputUnits),
        "choiceOption": jsonEncode(choiceOption),
        "otherOptions": jsonEncode(otherOptions),
        "occupancy": occupancy.toJson(),
      };

      return jsonEncode(map);
    }

    static FixtureUnit fromJson(dynamic json){
      if(json != null){
        Map map = jsonDecode(json);
        TypeOfOccupancy occupancy = TypeOfOccupancy.fromJson(map["occupancy"]);
        FixtureUnit unit = FixtureUnit(occupancy);
        unit.inputUnits = Map.castFrom(jsonDecode(map["inputUnits"])); 
        unit.outputUnits = Map.castFrom(jsonDecode(map["outputUnits"]));

        //unit.otherOptions
        List temp = List.castFrom(jsonDecode(map["otherOptions"]));
        for(int i = 0; i < temp.length; i++){
          List<String> temp1 = List<String>();
          temp[i].forEach((element) {
            temp1.add(element.toString());
          });
          unit.otherOptions[i] = temp1;
        }
        unit.choiceOption = jsonDecode(map["choiceOption"]);

        //unit
        Map unitMap = jsonDecode(map["unit"]);
        Map<PairEntry,double> unt = Map<PairEntry,double>();
        unitMap.forEach((key, value) {
          unt[PairEntry.fromJson(key.toString())] = value;
        });
        unit.unit = unt;
        return unit;
      }
      return null;
    }
}