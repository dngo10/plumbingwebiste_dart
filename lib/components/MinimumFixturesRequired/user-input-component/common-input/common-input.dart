
import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';

import '../../../../Interfaces/table422_1Units.dart';
import '../../../../LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

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

  Set<table422_1Units> allowedSet;
  Map<table422_1Units, String> unitMap;
  Set<table422_1Units> commonSet;
  Set<table422_1Units> restrictedSet;

  CommonInput() {
    restrictedSet = {
      table422_1Units.person,
      table422_1Units.female,
      table422_1Units.male,
      table422_1Units.patient,
      table422_1Units.room
    };
  }

  @override
  void ngAfterChanges() {
    if (fixtureUnit != null && fakemap != null) {
      allowedSet = fixtureUnit.GetUnitsAllowanceEnum();
      unitMap = table422_1Units_Names;

      bool isMustChoose = allowedSet.contains(table422_1Units.room) &&
          allowedSet.contains(table422_1Units.patient);

      commonSet = Set<table422_1Units>();

      allowedSet.forEach((element) {
        if (!restrictedSet.contains(element)) {
          commonSet.add(element);
        } else if (!isMustChoose &&
            (element == table422_1Units.room ||
                element == table422_1Units.patient)) {
          commonSet.add(element);
        }
      });
    }
  }
}