import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

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

    double femaleWaterClosetAddIn;
    double maleUrinalsAllowedToBeAdded;
    double userUrinalsAdded;

    TotalFacilitiesRequired(){
        fixtureUnitArray = List<FixtureUnit>();
        totalRequiredFixture = Map<table422_1Categories, double>();

        table422_1CategoriesNames.forEach((key, value) {
          totalRequiredFixture[key] = 0;
        });
    }

    // This is to make sure it will complide to Note 3, of the Table 422_1.
    AddFemaleWaterCloset(){
        Map<TotMaFe, double> totalResult = this.GetTotalMaleFemaleClosetUrinals();
        if(totalResult[TotMaFe.totalFemaleCloset] <= 
            totalResult[TotMaFe.totalMaleCloset] + 
            totalResult[TotMaFe.totalMaleUrinals]
        ){
            this.femaleWaterClosetAddIn = 
            totalResult[TotMaFe.totalMaleCloset]  + 
            totalResult[TotMaFe.totalMaleUrinals] -
            totalResult[TotMaFe.totalFemaleCloset];
        }
    }

    // This is to make it will compli to Note 4 of Table 422_1.
    ReducableFixture(){
        Map<TotMaFe, double> totalResult  = this.GetTotalMaleFemaleClosetUrinals();
        maleUrinalsAllowedToBeAdded = totalResult[TotMaFe.totalMaleCloset] * 2.0/3.0;
    }

    Map<TotMaFe,double> GetTotalMaleFemaleClosetUrinals(){
        double totalMaleUrinals = 0;
        double totalFemaleCloset = 0;
        double totalMaleCloset = 0;

        fixtureUnitArray.forEach((element) {
          element.unit.forEach((key, value) {
            if(key.t1 == table422_1Categories.urinals && key.t2 == table422_1Units.male){
              totalMaleUrinals += value;
            }else if(key.t1 == table422_1Categories.waterClosets && key.t2 == table422_1Units.male){
              totalMaleCloset += value;
            } else if(key.t1 == table422_1Categories.waterClosets && key.t2 == table422_1Units.female){
              totalFemaleCloset += value;
            }
          });
        });

        return {
          TotMaFe.totalFemaleCloset : totalFemaleCloset,
          TotMaFe.totalMaleCloset:   totalMaleCloset,
          TotMaFe.totalMaleUrinals:  totalMaleUrinals,
        };
    }

    AddFixtureOccupancy(FixtureUnit occupancy){
        FixtureUnit newFu = occupancy.Clone();
        fixtureUnitArray.add(newFu);
    }

    RemoveFixtureOccupancy(FixtureUnit occupancy){
        fixtureUnitArray.remove(occupancy);
    }

    Recalculate(){
        totalRequiredFixture.clear();

        fixtureUnitArray.forEach((element) {
          element.Recalculate();
          AddToTotalFixtureRequired(element.fixtureRequireds);
        });
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