import 'dart:collection';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_components/material_button/material_button.dart';

import 'male-female-input/male-female-input.dart';
import 'occupancy-infor-card/occupancy-infor-card.dart';

@Component(
  selector: 'user-input-based-on-occupancy',
  templateUrl: 'user-input-component.html',
  styleUrls: ['user-input-component.css',
              'package:angular_components/app_layout/layout.scss.css',
             ],
  directives: [coreDirectives,
               OccupancyInforCard,
               MaterialButtonComponent,
               MaleFemaleInput,
  ]
)
class UserInputBasedOnOccupancy implements AfterChanges{
  @Input() TypeOfOccupancy occupancy;
  FixtureUnit fixtureUnit;
  Set<table422_1Units> allowedUnits;
  Set<String> allowedUnitsString;
  LinkedHashMap<table422_1Units,double> abc;
  LinkedHashMap<table422_1Units,double>old_abc;

  @override
  void ngAfterChanges() {
    if(occupancy != null){
      fixtureUnit = FixtureUnit(occupancy);

      allowedUnits = fixtureUnit.GetUnitsAllowanceEnum();
      allowedUnitsString = fixtureUnit.GetUnitsAllowanceStrings();
      old_abc = abc;
    }
    // TODO: implement ngAfterChanges
  }

  void isConvertible(){
    bool hasMale = allowedUnits.contains(table422_1Units.male);
    bool hasFemale = allowedUnits.contains(table422_1Units.female);
  }

  void runthis(var event){
    abc = event;
    print(abc);
  }
}