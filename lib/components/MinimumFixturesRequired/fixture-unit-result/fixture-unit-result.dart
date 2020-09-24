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
  Set<String> catSet;
  Map<String, String> iconUrl;
  Set<String> unitSet = Table422_1Units.InputSet;
  Set<String> otherSet = Table422_1Categories.OtherSet;

  Set<String> primaryOutput = Set<String>(); // NOT INCLUDED "OTHER" FIXTURES

  @override
  void ngOnInit(){
    iconUrl = fixtureIconUrl;
    catSet = Table422_1Categories.OutputSet;
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