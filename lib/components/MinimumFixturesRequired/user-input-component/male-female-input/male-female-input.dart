import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
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
  ]
)
class MaleFemaleInput implements AfterChanges, OnInit{
  @Input() Set<table422_1Units> allowedSet;

  Map<table422_1Units, double> amountReturn;
  Set<table422_1Units> commonInput;
  var unitMap;

  final _amountReturn = StreamController<Map<String, double>>();

  double male, female, person;
  

  @override
  void ngAfterChanges() {
    // TODO: implement ngAfterChanges

    amountReturn = Map<table422_1Units,double>();
    commonInput = Set<table422_1Units>();
    
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

    print(amountReturn);
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

  maleKeyUp(){
    if(male != null && female != null && person != null){
      female = person - male;
    }
  }

  femaleKeyUp(){
    if(male != null && female != null && person != null){
      female = person - male;
    }
  }

  personKeyUp(){
    if(male != null && female != null && person != null){
      female = (person/2.0).ceil().toDouble();
      male = person -female;
    }
  }

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
    unitMap = table422_1Units_Names;;
  }


}