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

  Map<String, double> items;
  Set<String> catMap = Table422_1Categories.OtherSet;
  Map<String, String> urlMap =  fixtureIconUrl;
  Set<String> unitMap = Table422_1Units.InputSet;
  Set<String> otherEnum = Table422_1Categories.OtherSet;

  @override
  void ngOnInit() {
  }

  @override
  void ngAfterChanges() {
    items = Map<String, double>();
    if(fixtureUnit != null){
      fixtureUnit.outputUnits.forEach((key, value) {
        //if(!otherEnum.contains(key)){
          items[key] =value;
          
        //}
      });
    }
  }

}