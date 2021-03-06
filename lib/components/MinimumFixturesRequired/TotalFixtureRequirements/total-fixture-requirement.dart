import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/PatientRoom.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/Pfm.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';
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
    ],
    providers: [ClassProvider(OccupantLoadFactorService)]
    )
class TotalFixtureRequirement implements OnInit {
  @Input() TotalFacilitiesRequired totalFacilitiesRequired;

  @Input() FixtureUnit fixtureUnit;
  @Input() OccupantLoadFactor occupantLoadFactor;
  @Input() Pfm gen;
  @Input() PatientRoom pt;
  @Input() CommonInputList fakemap;

  OccupantLoadFactorService occupantLoadFactorService;
  Map<table422_1Categories, String> urlMap =  fixtureIconUrl;

  //CanvasElement canvas;

  TotalFixtureRequirement(this.occupantLoadFactorService) {}

  @override
  void ngOnInit() {}

  deleteItem(FixtureUnit item) {
    if(item == fixtureUnit) return;
    if(item == totalFacilitiesRequired.fixtureUnitForEdit){
      totalFacilitiesRequired.isEditing = false;
      totalFacilitiesRequired.CancelFixtureEdit(fixtureUnit);
    }
    totalFacilitiesRequired.fixtureUnitArray.remove(item);
    totalFacilitiesRequired.Recalculate();

    //ixtureUnit.fixtureRequireds.keys
    
  }
}
