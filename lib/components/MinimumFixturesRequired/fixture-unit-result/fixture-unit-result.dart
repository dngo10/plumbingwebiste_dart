import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_app/components/MinimumFixturesRequired/fixture-unit-result/other-fixtures-result/other-fixtures-result.dart';
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
    OtherFixturesResult,
  ],
  pipes: [commonPipes]
)
class FixtureUnitResult implements AfterChanges, OnInit {
  @Input() FixtureUnit fixtureUnit;
  Map<table422_1Categories, String> catMap;
  Map<table422_1Categories, String> iconUrl;
  Map<table422_1Units, String> unitMap = table422_1Units_Names;
  Set<table422_1Categories> otherSet = OtherSet;

  Set<table422_1Categories> primaryOutput = Set<table422_1Categories>(); // NOT INCLUDED "OTHER" FIXTURES

  @override
  void ngOnInit(){
    iconUrl = fixtureIconUrl;
    catMap = table422_1CategoriesNames;
  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      primaryOutput.clear();
      fixtureUnit.outputUnits.forEach((key, value) {
        if(!otherSet.contains(key)){
          primaryOutput.add(key);
        }
      });
    }
  }
}