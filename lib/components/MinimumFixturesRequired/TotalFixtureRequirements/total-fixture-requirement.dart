import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../../LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'FixtureUnitDisplay/fixture-unit-display.dart';
import 'Total/total-resume.dart';

@Component(
    selector: 'total-fixture-requirement-app',
    templateUrl: 'total-fixture-requirement.html',
    styleUrls: [
      'total-fixture-requirement.css',
      'package:angular_components/app_layout/layout.scss.css'
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
      FixtureUnitDisplay,
      TotalResume,
    ])
class TotalFixtureRequirement implements OnInit {
  @Input() TotalFacilitiesRequired totalFacilitiesRequired;

  @Input() FixtureUnit fixtureUnit;

  //CanvasElement canvas;

  TotalFixtureRequirement() {}

  @override
  void ngOnInit() {}

  deleteItem(FixtureUnit item) {
    if(item == fixtureUnit) return;
    totalFacilitiesRequired.fixtureUnitArray.remove(item);
    totalFacilitiesRequired.Recalculate();
  }

  changeFixtureUnit(FixtureUnit item){
    totalFacilitiesRequired.fixtureUnitForEdit = item;
    totalFacilitiesRequired.outItem = item.Clone();
  }
}
