import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
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
  Set<table422_1Categories> otherEnum = OtherSet;

  @override
  void ngOnInit() {
  }

  @override
  void ngAfterChanges() {
    items = Map<table422_1Categories, double>();
    if(fixtureUnit != null){
      fixtureUnit.outputUnits.forEach((key, value) {
        //if(!otherEnum.contains(key)){
          items[key] =value;
          
        //}
      });
    }
  }

}