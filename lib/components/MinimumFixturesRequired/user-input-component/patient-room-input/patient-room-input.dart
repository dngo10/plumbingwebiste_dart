

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

  //Set<Table422_1Units>
  Set<String> allowedSet;

  //Set<Table422_1Units>
  Set<String> commonUnit;

  List<Option> choice;
  Option selected;
  PatientRoom pt;

  String ePatient, eRoom;

  PatientRoomInput(){
    pt = PatientRoom.Init();
    ePatient = Table422_1Units.patient;
    eRoom = Table422_1Units.room;
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
           Option(ePatient, true, false, ePatient),
           Option(eRoom, false, false, eRoom),
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
    String unit;
    bool selected;
    bool disabled;

    Option(this.label, this.selected, this.disabled, this.unit);
}