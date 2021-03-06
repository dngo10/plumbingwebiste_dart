import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector:    'fixture-unit-display-app',
  templateUrl: 'fixture-unit-display.html',
  styleUrls: [ 'fixture-unit-display.css',
               'package:angular_components/app_layout/layout.scss.css'
             ],
  directives: [coreDirectives,
               formDirectives,
               materialInputDirectives,
               materialNumberInputDirectives,
              ]
)
class FixtureUnitDisplay implements OnInit, AfterChanges{
  
  @Input() FixtureUnit fixtureUnit;

  Map<table422_1Categories, double> items;
  Map<table422_1Categories, String> catMap = table422_1CategoriesNames;
  Map<table422_1Categories, String> urlMap =  fixtureIconUrl;
  Map<table422_1Units, String> unitMap = table422_1Units_Names;

  table422_1Categories otherEnum = table422_1Categories.other;

  Set<table422_1Units> allowedUnit;

  String other = "";

  @override
  void ngOnInit() {

  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      items = fixtureUnit.fixtureRequireds;
      fixtureUnit.GetUnitsAllowanceEnum();
      allowedUnit = fixtureUnit.GetUnitsAllowanceEnum();

      if(allowedUnit.contains(table422_1Units.otherMultiple1)){
        other = unitMap[table422_1Units.otherMultiple1];
      }else if(allowedUnit.contains(table422_1Units.otherMultiple2)){
        other = unitMap[table422_1Units.otherMultiple2];
      }else if(allowedUnit.contains(table422_1Units.servicesinkkOrlaundrytray)){
        other = unitMap[table422_1Units.servicesinkkOrlaundrytray];
      }
    }
  }

}