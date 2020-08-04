import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';

@Component(
  selector: 'common-input-app',
  templateUrl: 'common-input.html',
  styleUrls: ['common-input.css',
              'package:angular_components/app_layout/layout.scss.css',
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
  ]
)
class CommonInput implements AfterChanges{
  @Input() FixtureUnit fixtureUnit;
  
  Set<table422_1Units> allowedSet;
  Map<table422_1Units, String> unitMap;
  Set<table422_1Units> commonSet;
  Set<table422_1Units> restrictedSet;

  CommonInput(){
    restrictedSet={table422_1Units.person,
                   table422_1Units.female,
                   table422_1Units.male,
                   table422_1Units.patient,
                   table422_1Units.room,
    };
  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      allowedSet = fixtureUnit.GetUnitsAllowanceEnum();
      unitMap = table422_1Units_Names;

      commonSet = Set<table422_1Units>();

      allowedSet.forEach((element) {
        if(!restrictedSet.contains(element)){
          commonSet.add(element);
        }
      });
    }
  }
}