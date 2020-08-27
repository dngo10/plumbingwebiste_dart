import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';


class Pfm {
  double _male = 0, _female = 0, _person = 0;
  FixtureUnit fixtureUnit;

  bool hasm, hasf, hasp;

  Pfm(this.fixtureUnit){
    setHasmHasf();
  }

  Pfm.Init();

  var emale = table422_1Units.male;
  var efemale = table422_1Units.female;
  var eperson = table422_1Units.person;
  
  void setHasmHasf(){
      hasm = fixtureUnit.inputUnits.containsKey(emale);
      hasf = fixtureUnit.inputUnits.containsKey(efemale);
      hasp = fixtureUnit.inputUnits.containsKey(eperson);
  }

  bool isValid(){
    if(fixtureUnit != null){
      setHasmHasf();
      if(hasm && hasf){
        return true;
      }else if(fixtureUnit.inputUnits.containsKey(eperson)){
        return true;
      }else{
        return false;
      }
    }
    return false;
  }

  double get male {
    return _male;
  }

  double get female {
    return _female;
  }

  double get person {
    return _person;
  }

  // This folder is intended for setting male, female, person.
  void set male(double value) {
    if (value != null && value >= 0 && _male != value) {
      _male = value;
      if (fixtureUnit != null) {
        _maleTriggered();
        _assign();
        fixtureUnit.Recalculate();
      }
    }
  }

  void set female(double value) {
    if (value != null && value >= 0 && _female != value) {
      _female = value;
      if (fixtureUnit != null) {
        _femaleTriggered();
        _assign();
        fixtureUnit.Recalculate();
      }
    }
  }

  void set person(double value) {
    if (value != null && value >= 0 && _female != value) {
      _person = value;
      if (fixtureUnit != null) {
        _personTriggered();
        _assign();
        fixtureUnit.Recalculate();
      }
    }
  }

  void _assign(){
    if(fixtureUnit != null){
      if(fixtureUnit.inputUnits.containsKey(eperson)){
        fixtureUnit.inputUnits[eperson] = _person;
      }
      if(fixtureUnit.inputUnits.containsKey(efemale)){
        fixtureUnit.inputUnits[efemale] = _female;
      }
      if(fixtureUnit.inputUnits.containsKey(eperson)){
        fixtureUnit.inputUnits[emale] = _male;
      }
    }
  }

  void _personTriggered() {
    if (hasm) _female = (_person / 2.0).ceil().toDouble();
    if (hasf) _male = _person - female;
  }

  void reset(){
    _person = 0;
    _female = 0;
    _male = 0;
  }

    void _maleTriggered() {
    if (hasp && hasf) {
      _person = _male + _female;
    } else if (hasp && hasf) {
      if (_person > _male) {
        _female = _person - _male;
      } else {}
    } else if (_person != null && _female != null) {
      if (_male > _person || _female > _person) {
      } else {
        _female = _person - _male;
      }
    }
  }

  void _femaleTriggered() {
    if (_person == null && _male != null) {
      _person = _female + _male;
    } else if (_person != null && _male == null) {
      if (_person > _female) {
        _male = _person - _female;
      } else {}
    } else if (_person != null && _male != null) {
      if (_female > _person || _male > _person) {
      } else {
        _male = _person - _female;
      }
    }
  }

}
