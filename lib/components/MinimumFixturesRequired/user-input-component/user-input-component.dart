import 'dart:io';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

@Component(
  selector: 'user-input-based-on-occupancy',
  templateUrl: 'user-input-component.html',
  styleUrls: ['user-input-component.css',
              'package:angular_components/app_layout/layout.scss.css',
             ],
  directives: [coreDirectives]
)
class UserInputBasedOnOccupancy implements AfterChanges{
  @Input() TypeOfOccupancy occupancy;
  FixtureUnit fixtureUnit;

  @override
  void ngAfterChanges() {
    if(occupancy != null){
      fixtureUnit = FixtureUnit(occupancy);
    }
    // TODO: implement ngAfterChanges
  }

}