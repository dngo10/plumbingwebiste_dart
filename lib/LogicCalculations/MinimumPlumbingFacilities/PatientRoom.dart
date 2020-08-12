import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

class PatientRoom{
    FixtureUnit fixtureUnit;

    PatientRoom(this.fixtureUnit){}

    PatientRoom.Init();

    double _numOfRoom = 0, _numOfPatient = 0;

    void Setup(FixtureUnit fixtureUnit){
      this.fixtureUnit = fixtureUnit;
      if(fixtureUnit.inputUnit.containsKey(table422_1Units.room)){
        _numOfRoom = fixtureUnit.inputUnit[table422_1Units.room];
      }

      if(fixtureUnit.inputUnit.containsKey(table422_1Units.patient)){
        _numOfPatient = fixtureUnit.inputUnit[table422_1Units.patient];
      }
    }

    bool isValid(){
      if(fixtureUnit != null){
        if(fixtureUnit.inputUnit.containsKey(table422_1Units.room) &&
           fixtureUnit.inputUnit.containsKey(table422_1Units.patient)
        ){
          return true;
        }else{
          return false;
        }
      }return false;
    }

    double get numOfRoom{return _numOfRoom;}
    void set numOfRoom(double value){
      if(value != null &&
         value >= 0 &&
         value != _numOfRoom &&
         fixtureUnit != null){
          if(fixtureUnit.inputUnit.containsKey(table422_1Units.room)){
            _numOfRoom = value;
            fixtureUnit.inputUnit[table422_1Units.room] = value;
            if(fixtureUnit.inputUnit.containsKey(table422_1Units.patient)){
              fixtureUnit.inputUnit[table422_1Units.patient] = 0;
              _numOfPatient = 0;
            }
            fixtureUnit.Recalculate();
          }
      }
    }

    double get numOfPatient{return _numOfPatient;}
    void set numOfPatient(double value){
      if(value != null &&
         value >= 0 &&
         value != _numOfPatient &&
         fixtureUnit != null){
          if(fixtureUnit.inputUnit.containsKey(table422_1Units.patient)){
            _numOfPatient = value;
            fixtureUnit.inputUnit[table422_1Units.patient] = value;
            if(fixtureUnit.inputUnit.containsKey(table422_1Units.room)){
              fixtureUnit.inputUnit[table422_1Units.room] = 0;
              _numOfRoom = 0;
            }
            fixtureUnit.Recalculate();
          }
      }
    }
}