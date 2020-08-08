
import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';

import '../../../../Interfaces/table422_1Units.dart';
import '../../../../LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import '../../../../LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
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
      MaterialInputComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
      materialInputDirectives,
      materialNumberInputDirectives,
    ])
class CommonInput implements AfterChanges {
  @Input()
  FixtureUnit fixtureUnit;

  FakeMap fakeMap;

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
      table422_1Units.room,
      table422_1Units.otherMultiple1,
      table422_1Units.otherMultiple2,
      table422_1Units.servicesinkkOrlaundrytray,
    };
  }

  @override
  void ngAfterChanges() {
    if (fixtureUnit != null) {
      allowedSet = fixtureUnit.GetUnitsAllowanceEnum();
      fakeMap = FakeMap(fixtureUnit);
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

class FakeMap {
  FixtureUnit fixtureUnit;
  Map<table422_1Units, DoubleObj> tempMap = Map<table422_1Units, DoubleObj> ();

  FakeMap(this.fixtureUnit ) {
    if (this.fixtureUnit != null) {
      fixtureUnit.inputUnit.forEach((key, value) {
        DoubleObj douObj = DoubleObj(fixtureUnit, key);
        douObj.value = value;
        tempMap[key] = douObj;
      });
    }
  }
}

class DoubleObj {
  //WRONG, BUT FIXTUREUNIT HERE, MUST RECALCULATE
  FixtureUnit fixtureUnit;
  table422_1Units cat;
  double _value = 0;

  double get value {
    return _value;
  }

  void set value(double v) {
    if(v >= 0 && v != null && v != _value){
      if (fixtureUnit != null) {
        if (fixtureUnit.inputUnit.containsKey(cat)) {
          if (fixtureUnit.inputUnit[cat] != v) {
            fixtureUnit.inputUnit[cat] = v;
            fixtureUnit.Recalculate();
            _value = v;
          }
        }
      }
    }
  }

  DoubleObj(this.fixtureUnit, this.cat) {}
}
