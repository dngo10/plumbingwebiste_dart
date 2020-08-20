

import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

class OtherLogicController{
  FixtureUnit fixtureUnit;
  Set<table422_1Units> otherUnitSet;

  double _serviceSink = 0,
         _laundryStray = 0,
         _kitchenSink = 0,
         _automatic_clothes_washer = 0;

  double get serviceSink => _serviceSink;
  double get laundryStray => _laundryStray;
  double get kitchenSink => _kitchenSink;
  double get automatic_clothes_washer => _automatic_clothes_washer;

  


  int _CheckCombo(){
    otherUnitSet = fixtureUnit.GetUnitsByCategories(table422_1Categories.other);
  }

}
