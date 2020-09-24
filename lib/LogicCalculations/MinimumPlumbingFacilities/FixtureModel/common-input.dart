import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';

class CommonInputList {
  FixtureUnit fixtureUnit;
  Map<String, DoubleObj> tempMap = Map<String, DoubleObj> ();

  CommonInputList.Init();

  CommonInputList(this.fixtureUnit ) {
    if (this.fixtureUnit != null) {
      fixtureUnit.inputUnits.forEach((key, value) {
        DoubleObj douObj = DoubleObj(fixtureUnit, key);
        douObj.value = value;
        tempMap[key] = douObj;
      });
    }
  }

  //void Setup(FixtureUnit fixtureUnit){
  //  this.fixtureUnit = fixtureUnit;
  //  if (this.fixtureUnit != null) {
  //    fixtureUnit.inputUnits.forEach((key, value) {
  //      DoubleObj douObj = DoubleObj(fixtureUnit, key);
  //      douObj.value = value;
  //      tempMap[key] = douObj;
  //    });
  //  }
  //}
}



class DoubleObj {
  //WRONG, BUT FIXTUREUNIT HERE, MUST RECALCULATE
  FixtureUnit fixtureUnit;
  String cat;
  double _value = 0;

  double get value {
    return _value;
  }

  void set value(double v) {
    if(v >= 0 && v != null && v != _value){
      if (fixtureUnit != null) {
        if (fixtureUnit.inputUnits.containsKey(cat)) {
          if (fixtureUnit.inputUnits[cat] != v) {
            fixtureUnit.inputUnits[cat] = v;
            fixtureUnit.Recalculate();
            _value = v;
          }
        }
      }
    }
  }
  DoubleObj(this.fixtureUnit, this.cat) {}
}