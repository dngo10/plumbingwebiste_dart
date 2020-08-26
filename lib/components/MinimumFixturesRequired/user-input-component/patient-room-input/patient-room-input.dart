

import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/PatientRoom.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';

import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_radio/material_radio.dart';
import 'package:angular_components/material_radio/material_radio_group.dart';

@Component(
  selector: 'patient-room-input',
  templateUrl: 'patient-room-input.html',
  styleUrls: ['patient-room-input.css',
              'package:angular_components/app_layout/layout.scss.css'
             ],
  directives: [
               coreDirectives,
               formDirectives,
               materialInputDirectives,
               materialNumberInputDirectives,
               MaterialRadioComponent,
               MaterialRadioGroupComponent,
  ],
)
class PatientRoomInput implements OnInit, AfterChanges {
  @Input() FixtureUnit fixtureUnit;
  bool checkAvailable = false;
  Set<table422_1Units> allowedSet;
  Set<table422_1Units> commonUnit;

  Map<table422_1Units, String> unitMap;

  List<Option> choice;
  Option selected;
  PatientRoom pt;

  table422_1Units ePatient, eRoom;

  PatientRoomInput(){
    pt = PatientRoom.Init();
    ePatient = table422_1Units.patient;
    eRoom = table422_1Units.room;
    unitMap = table422_1Units_Names;
  }

  @override
  void ngOnInit() {

  }

    @override
    void ngAfterChanges() {
      if(fixtureUnit != null){
        allowedSet = fixtureUnit.GetInputPutAllowedEnum();

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

         pt.fixtureUnit = fixtureUnit;
      }
    }

    void changed(){
      if(selected != null){
        if(selected.unit == eRoom){
          fixtureUnit.inputUnits[ePatient] = 0;
        }else if(selected.unit == ePatient){
          fixtureUnit.inputUnits[eRoom] = 0;
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