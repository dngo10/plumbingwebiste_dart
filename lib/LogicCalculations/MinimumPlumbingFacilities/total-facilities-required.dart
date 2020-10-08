import 'dart:convert';

import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/waterclosets-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureCalculations/urinals-cal.dart';

class TotMaFe{
  static String totalFemaleCloset = "totalFemaleCloset";
  static String totalMaleCloset = "totalMaleCloset";
  static String totalMaleUrinals = "totalMaleUrinals";
}

class TotalFacilitiesRequired{

    FixtureUnit fixtureUnitForEdit;
    FixtureUnit outItem;
    bool isEditing =  false;

    List<FixtureUnit> fixtureUnitArray;

    ///Map<Table422_1Categories, double>
    Map<String, double> totalRequiredFixture;

    double femaleWaterClosetAddIn = 0;
    double maleUrinalsAllowedToBeAdded = 0;
    double userUrinalsAdded = 0;

    int sliderValue = 0; // This is for slider;

    Map<String, double> totalFixtureBasedOnGender = <String, double>{
      TotMaFe.totalFemaleCloset : 0 ,
      TotMaFe.totalMaleCloset : 0,
      TotMaFe.totalMaleUrinals : 0
    };

    TotalFacilitiesRequired(){
        fixtureUnitArray = List<FixtureUnit>();
        totalRequiredFixture = Map<String, double>();

        Table422_1Categories.OutputSet.forEach((key) {
          totalRequiredFixture[key] = 0;
        });
    }

    // This is to make sure it will complide to Note 3, of the Table 422_1.
    AddFemaleWaterCloset(){
        this.GetTotalMaleFemaleClosetUrinals();
        if(totalFixtureBasedOnGender[TotMaFe.totalFemaleCloset] <= 
            totalFixtureBasedOnGender[TotMaFe.totalMaleCloset] + 
            totalFixtureBasedOnGender[TotMaFe.totalMaleUrinals]
        ){
            this.femaleWaterClosetAddIn = 
            totalFixtureBasedOnGender[TotMaFe.totalMaleCloset]  + 
            totalFixtureBasedOnGender[TotMaFe.totalMaleUrinals] -
            totalFixtureBasedOnGender[TotMaFe.totalFemaleCloset];
        }
    }

    // This is to make it will compli to Note 4 of Table 422_1.
    ReducableFixture(){
        GetTotalMaleFemaleClosetUrinals();
        maleUrinalsAllowedToBeAdded = (totalFixtureBasedOnGender[TotMaFe.totalMaleCloset] * 2.0/3.0).floor().toDouble();
    }

    void GetTotalMaleFemaleClosetUrinals(){
        _ResetTotalBasedGender();

        fixtureUnitArray.forEach((element) {
          element.unit.forEach((key, value) {
            if(key.t1 == Table422_1Categories.urinals && key.t2 == Table422_1Units.male){
              totalFixtureBasedOnGender[TotMaFe.totalMaleUrinals] += MaleUrinalsCount(element.occupancy, value);
            }else if(key.t1 == Table422_1Categories.waterClosets && key.t2 == Table422_1Units.male){
              totalFixtureBasedOnGender[TotMaFe.totalMaleCloset] += MaleWaterClosetsCount(element.occupancy, value);
            } else if(key.t1 == Table422_1Categories.waterClosets && key.t2 == Table422_1Units.female){
              totalFixtureBasedOnGender[TotMaFe.totalFemaleCloset] += FemaleWaterClosetsCount(element.occupancy, value);
            }
          });
        });
    }

    _ResetTotalBasedGender(){
      totalFixtureBasedOnGender.forEach((key, value) {
        totalFixtureBasedOnGender[key] = 0;
      });
    }

    AddFixtureOccupancy(FixtureUnit fixtureUnit){
        FixtureUnit newFu = fixtureUnit.clone();
        fixtureUnitArray.add(newFu);
    }

    RemoveFixtureOccupancy(FixtureUnit occupancy){
        fixtureUnitArray.remove(occupancy);
        sliderValue = 0;
    }

    Recalculate(){
        sliderValue = 0;
        totalRequiredFixture.clear();

        fixtureUnitArray.forEach((element) {
          element.Recalculate();
          AddToTotalFixtureRequired(element.outputUnits);
        });

        ReducableFixture();
        AddFemaleWaterCloset();
    }

    AddToTotalFixtureRequired(Map<String, double> item){
      item.forEach((key, v) {
        if(totalRequiredFixture.containsKey(key)){
          totalRequiredFixture[key] +=  v;
        }else{
          totalRequiredFixture[key] = v;
        }
      });
    }

    PrepareForEdit(FixtureUnit fu, FixtureUnit item){
      fixtureUnitForEdit = item;
      fu.Merge(fixtureUnitForEdit);
      isEditing = true;
    }

    //Implement stag here.
    SaveBackFixtureRequired(FixtureUnit fu){
      int index = fixtureUnitArray.indexOf(fixtureUnitForEdit);
      if(index < 0){return;}

      fixtureUnitArray.removeAt(index);
      fixtureUnitArray.insert(index, fu.clone());
      isEditing =  false;
    }

    CancelFixtureEdit(FixtureUnit fu){
      fu.Merge(fixtureUnitForEdit.clone());
      isEditing = false;
    }

    String toJson(){
      List<String> list = List<String>();
      fixtureUnitArray.forEach((element) {
        list.add(element?.toJson());
      });

      Map map = {
        "fixtureUnitForEdit" : fixtureUnitForEdit?.toJson(),
        "outItem": outItem?.toJson(),
        "isEditing": isEditing,
        "totalRequiredFixture": totalRequiredFixture,
        "fixtureUnitArray": list,
        "femaleWaterClosetAddIn": femaleWaterClosetAddIn,
        "maleUrinalsAllowedToBeAdded": maleUrinalsAllowedToBeAdded,
        "userUrinalsAdded" : userUrinalsAdded,
        "sliderValue" : sliderValue,
        "totalFixtureBasedOnGender" : totalFixtureBasedOnGender

      };
      return jsonEncode(map);
    }

    static TotalFacilitiesRequired fromJson(String json){ 
      if(json[0] == '\'' && json[json.length-1] == '\'')
        json = json.substring(1, json.length-1); 
      Map map = jsonDecode(json);
      TotalFacilitiesRequired total = TotalFacilitiesRequired();


      total.fixtureUnitForEdit = FixtureUnit.fromJson(map["fixtureUnitForEdit"]); 
      total.outItem = FixtureUnit.fromJson(map["outItem"]);
      total.femaleWaterClosetAddIn = map["femaleWaterClosetAddIn"];
      total.isEditing = map["isEditing"];
      total.maleUrinalsAllowedToBeAdded = map["maleUrinalsAllowedToBeAdded"];
      total.userUrinalsAdded = map["userUrinalsAdded"];
      total.sliderValue = map["sliderValue"];
      total.totalRequiredFixture = Map.castFrom(map["totalRequiredFixture"]);
      total.totalFixtureBasedOnGender = Map.castFrom(map["totalFixtureBasedOnGender"]);

      //Cast FixtureArray
      List<String> fixtureArray = List<String>();
      List FArr = map["fixtureUnitArray"];
      if(FArr != null){
        List<String> list = List<String>();
        FArr.forEach((element) {
          list.add(element.toString());
        });
        fixtureArray = list;
      }

      List<FixtureUnit> fixtures = List<FixtureUnit>();
      fixtureArray.forEach((element) {
        fixtures.add(FixtureUnit.fromJson(element));
      });
      total.fixtureUnitArray = fixtures;
      return total;
    }
    
}