

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';

import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';

import '../../../../Interfaces/table422_1Units.dart';
import '../../../../LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';

@Component(
  selector: 'patient-room-input',
  templateUrl: 'patient-room-input.html',
  styleUrls: ['patient-room-input.css',
              'package:angular_components/app_layout/layout.scss.css'
             ],
  directives: [
    coreDirectives,
               formDirectives,
               MaterialInputComponent,
               MaterialFabComponent,
               MaterialIconComponent,
               MaterialButtonComponent,
               materialInputDirectives,
               materialNumberInputDirectives,
  ],
  providers: [ClassProvider(OccupantLoadFactorService)],
)
class PatientRoomInput implements OnInit, AfterChanges ,AfterContentChecked {
  @Input() FixtureUnit fixtureUnit;
  bool checkAvailable = false;
  Set<table422_1Units> allowedSet;
  Set<table422_1Units> commonUnit;

  Map<table422_1Units, String> unitMap;

  List<Option> choice;
  Option selected;
  OccupantLoadFactorService loadFactorUnit;
  PatientRoom pt;

  table422_1Units ePatient, eRoom;

  PatientRoomInput(this.loadFactorUnit){
    ePatient = table422_1Units.patient;
    eRoom = table422_1Units.room;
    unitMap = table422_1Units_Names;
  }

  @override
  void ngOnInit() {

  }

  @override
  void ngAfterContentChecked() {


  }

    @override
    void ngAfterChanges() {
    // TODO: implement ngAfterChanges
      if(fixtureUnit != null){
        allowedSet = fixtureUnit.GetUnitsAllowanceEnum();

        if(allowedSet.contains(ePatient) && allowedSet.contains(eRoom)){
          checkAvailable = true;
        }else{
          checkAvailable = false;
        }

        choice = [
           Option(unitMap[ePatient], true, false, ePatient),
           Option(unitMap[eRoom], false, false, eRoom),
         ];

         selected = choice.firstWhere((o) => o.selected);

         pt = PatientRoom(fixtureUnit);
      }
    }

    void changed(){
      if(selected != null){
        if(selected.unit == eRoom){
          fixtureUnit.inputUnit[ePatient] = 0;
        }else if(selected.unit == ePatient){
          fixtureUnit.inputUnit[eRoom] = 0;
        }
        fixtureUnit.Recalculate();
      }
    }
  }

class Option {
    final String label;
    table422_1Units unit;
    bool selected;
    bool disabled;

    Option(this.label, this.selected, this.disabled, this.unit);
}

class PatientRoom{
    FixtureUnit fixtureUnit;

    PatientRoom(this.fixtureUnit){}

    double _numOfRoom = 0, _numOfPatient = 0;

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