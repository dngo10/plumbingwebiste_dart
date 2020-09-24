
import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';

import '../../../../Interfaces/table422_1Units.dart';
import '../../../../LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';

@Component(
    selector: 'common-input-app',
    templateUrl: 'common-input.html',
    styleUrls: [
      'common-input.css',
      'package:angular_components/app_layout/layout.scss.css',
    ],
    directives: [
      coreDirectives,
      formDirectives,
      materialInputDirectives,
      materialNumberInputDirectives,
    ])
class CommonInput implements AfterChanges {
  @Input()
  FixtureUnit fixtureUnit;

  @Input()
  CommonInputList fakemap;

  Set<String> allowedSet;
  Map<String, String> unitMap;
  Set<String> commonSet;
  Set<String> restrictedSet;

  CommonInput() {
    restrictedSet = {
      Table422_1Units.person,
      Table422_1Units.female,
      Table422_1Units.male,
      Table422_1Units.patient,
      Table422_1Units.room,
      Table422_1Units.none
    };
  }

  @override
  void ngAfterChanges() {
    if (fixtureUnit != null && fakemap != null) {
      allowedSet = fixtureUnit.GetInputPutAllowedEnum();

      bool isMustChoose = allowedSet.contains(Table422_1Units.room) &&
          allowedSet.contains(Table422_1Units.patient);

      commonSet = Set<String>();

      allowedSet.forEach((element) {
        if (!restrictedSet.contains(element)) {
          commonSet.add(element);
        } else if (!isMustChoose &&
            (element == Table422_1Units.room ||
                element == Table422_1Units.patient)) {
          commonSet.add(element);
        }
      });
    }
  }
}