

import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';

@Component(
  selector: 'other-fixtures-result-app',
  styleUrls: ['other-fixtures-result.css',
              'package:angular_components/app_layout/layout.scss.css',
              'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
              
  ],
  templateUrl: 'other-fixtures-result.html'
)
class OtherFixturesResult implements AfterChanges{
  @Input() FixtureUnit fixtureUnit;
  int numOfOptions;

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null && fixtureUnit.HasOtherFixture()){
      numOfOptions = fixtureUnit.otherOptions.length;
    }

  }

  
}