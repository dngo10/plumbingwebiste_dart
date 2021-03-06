import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/waterclosets-cal.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/urinals-cal.dart';

enum TotMaFe{
    totalFemaleCloset,
    totalMaleCloset,
    totalMaleUrinals
}


class TotalFacilitiesRequired{


    FixtureUnit fixtureUnitForEdit;
    FixtureUnit outItem;
    bool isEditing =  false;

    List<FixtureUnit> fixtureUnitArray;
    Map<table422_1Categories, double> totalRequiredFixture;

    Map<table422_1Categories, double> totalRequiredFixturePredict;

    double femaleWaterClosetAddIn;
    double maleUrinalsAllowedToBeAdded;
    double userUrinalsAdded;

    int sliderValue = 0; // This is for slider;

    Map<TotMaFe, double> totalFixtureBasedOnGender = <TotMaFe, double>{
      TotMaFe.totalFemaleCloset : 0 ,
      TotMaFe.totalMaleCloset : 0,
      TotMaFe.totalMaleUrinals : 0
    };

    TotalFacilitiesRequired(){
        fixtureUnitArray = List<FixtureUnit>();
        totalRequiredFixture = Map<table422_1Categories, double>();

        table422_1CategoriesNames.forEach((key, value) {
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
            if(key.t1 == table422_1Categories.urinals && key.t2 == table422_1Units.male){
              totalFixtureBasedOnGender[TotMaFe.totalMaleUrinals] += MaleUrinalsCount(element.occupancy, value);
            }else if(key.t1 == table422_1Categories.waterClosets && key.t2 == table422_1Units.male){
              totalFixtureBasedOnGender[TotMaFe.totalMaleCloset] += MaleWaterClosetsCount(element.occupancy, value);
            } else if(key.t1 == table422_1Categories.waterClosets && key.t2 == table422_1Units.female){
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

    AddFixtureOccupancy(FixtureUnit occupancy){
        FixtureUnit newFu = occupancy.Clone();
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
          AddToTotalFixtureRequired(element.fixtureRequireds);
        });

        ReducableFixture();
        AddFemaleWaterCloset();
        totalRequiredFixturePredict = Map<table422_1Categories, double>.from(totalRequiredFixture);
    }

    AddToTotalFixtureRequired(Map<table422_1Categories, double> item){
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
      fixtureUnitArray.insert(index, fu.Clone());
      isEditing =  false;
    }

    CancelFixtureEdit(FixtureUnit fu){
      fu.Merge(fixtureUnitForEdit.Clone());
      isEditing = false;
    }

    
    
}