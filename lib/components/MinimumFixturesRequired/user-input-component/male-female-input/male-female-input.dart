import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'male-female-input-plumbing',
  templateUrl: 'male-female-input.html',
  styleUrls: ['male-female-input.css',
              'package:angular_components/app_layout/layout.scss.css',
  ],
  directives: [coreDirectives,
               formDirectives,
               MaterialInputComponent,
               MaterialFabComponent,
               MaterialIconComponent,
               materialInputDirectives,
               materialNumberInputDirectives, 
  ],
  providers: [ClassProvider(OccupantLoadFactorService)]
)
class MaleFemaleInput implements AfterChanges, OnInit{
  Set<table422_1Units> allowedSet;
  @Input() FixtureUnit fixtureUnit;

  Map<table422_1Units, double> amountReturn;
  Set<table422_1Units> commonInput;

  var unitMap;

  var emale = table422_1Units.male;
  var efemale = table422_1Units.female;
  var eperson = table422_1Units.person;

  final _amountReturn = StreamController<Map<String, double>>();

  double male = 0, female = 0, person = 0;
  OccupantLoadFactorService occupantLoadFactorService;
  OccupantLoadFactor occupantLoadFactor;

  bool hasLoadFactor = false;

  MaleFemaleInput(this.occupantLoadFactorService){
  }

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
    unitMap = table422_1Units_Names;
  }

  

  @override
  void ngAfterChanges() {
    // TODO: implement ngAfterChanges
    if(fixtureUnit != null){
      allowedSet = fixtureUnit.GetUnitsAllowanceEnum();
      amountReturn = Map<table422_1Units,double>();
      commonInput = Set<table422_1Units>();

      occupantLoadFactor = occupantLoadFactorService.getLoadFactor(fixtureUnit.occupancy.type);
      print(fixtureUnit.occupancy.type);
      if(occupantLoadFactor != null){
        hasLoadFactor = true;
      }else{
        hasLoadFactor = false;
      }

      allowedSet.forEach((element) {
        if(element == table422_1Units.male){
          amountReturn[table422_1Units.male] = male==null ? 0 : male;
        } else if(element == table422_1Units.female){
          amountReturn[table422_1Units.female] = female ==null ? 0 : female;
        } else if(element == table422_1Units.person){
          amountReturn[table422_1Units.person] = person ==null ? 0 : person;
        }
        else{
          commonInput.add(element);
        }
      });
    }

  }

  @Output() Stream<Map<String, double>> get streamOutput => _amountReturn.stream;

  bool checkAvailability(){
    if(allowedSet.contains(table422_1Units.male) &&
       allowedSet.contains(table422_1Units.female) &&
       allowedSet.contains(table422_1Units.person)){
         return true;
       }
    return false;
  }
}