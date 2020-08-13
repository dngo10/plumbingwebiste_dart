import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'fixture-unit-result-app',
  templateUrl: 'fixture-unit-result.html',
  styleUrls: ['fixture-unit-result.css',
              'package:angular_components/app_layout/layout.scss.css',
              'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
              
  ],
  directives: [
    coreDirectives,
    formDirectives,
  ],
  pipes: [commonPipes]
)
class FixtureUnitResult implements AfterChanges, OnInit {
  @Input() FixtureUnit fixtureUnit;
  Map<table422_1Categories, String> catMap;
  Map<table422_1Categories, String> iconUrl;
  Map<table422_1Units, String> unitMap = table422_1Units_Names;

  Set<table422_1Units> allowedUnit;

  table422_1Categories otherEnum = table422_1Categories.other;

  String other = "";

  @override
  void ngOnInit() {
    iconUrl = fixtureIconUrl;
  }
  
  FixtureUnitResult(){

  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      catMap = table422_1CategoriesNames;
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