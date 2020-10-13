import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/PatientRoom.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/Pfm.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_app/components/MinimumFixturesRequired/fixture-unit-result/fixture-unit-result.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/patient-room-input/patient-room-input.dart';
import 'package:angular_components/material_button/material_button.dart';

import 'common-input/common-input.dart';
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
               PatientRoomInput,
               CommonInput,
               FixtureUnitResult,
  ]
)
class UserInputBasedOnOccupancy implements AfterChanges{
  @Input() TypeOfOccupancy occupancy;
  @Input() FixtureUnit fixtureUnit;
  @Input() OccupantLoadFactor occupantLoadFactor;

  @Input() Pfm gen;
  @Input() PatientRoom pt;
  @Input() CommonInputList fakemap;

  ///Set<Table422_1Units>
  Set<String> allowedUnits; 

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      allowedUnits = fixtureUnit.GetInputPutAllowedEnum();
    }
  }
}