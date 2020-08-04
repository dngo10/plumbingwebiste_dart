

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
               MaterialInputComponent,
               MaterialFabComponent,
               MaterialIconComponent,
               MaterialButtonComponent,
               materialInputDirectives,
               materialNumberInputDirectives,
               MaterialRadioComponent,
               MaterialRadioGroupComponent,
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
      }
    }

    void changed(){
      if(selected != null){
        if(selected.unit == eRoom){
          fixtureUnit.inputUnit[ePatient] = 0;
        }else if(selected.unit == ePatient){
          fixtureUnit.inputUnit[eRoom] = 0;
        }
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