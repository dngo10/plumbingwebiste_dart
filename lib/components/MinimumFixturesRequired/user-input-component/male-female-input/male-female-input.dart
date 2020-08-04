import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/load-factor/load-factor-based-on-area.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';

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
               MaterialButtonComponent,
               LoadFactorBasedOnArea,
               materialInputDirectives,
               materialNumberInputDirectives,
  ],
  providers: [ClassProvider(OccupantLoadFactorService)]
)
class MaleFemaleInput implements AfterChanges, OnInit{
  Set<table422_1Units> allowedSet;
  @Input() FixtureUnit fixtureUnit;

  double area =  0;

  //Map<table422_1Units, double> amountReturn;
  Set<table422_1Units> commonInput;

  var unitMap;

  var emale = table422_1Units.male;
  var efemale = table422_1Units.female;
  var eperson = table422_1Units.person;


  Map<String, bool>  currentClasses;

  //double male = 0, female = 0, person = 0;
  OccupantLoadFactorService occupantLoadFactorService;
  OccupantLoadFactor occupantLoadFactor;

  bool hasLoadFactor = false;

  bool hasp = false; // has person in fixture unit
  bool hasm = false; // has male in fixture unit
  bool hasf = false; // has female in fixture unit

  MaleFemaleInput(this.occupantLoadFactorService){

  }

  @override
  void ngOnInit() {
    unitMap = table422_1Units_Names;
  }

  @override
  void ngAfterChanges() {

    //This MUST RUN MUST to add person or NOT
    if(fixtureUnit != null){
      hasm = fixtureUnit.inputUnit.containsKey(emale);
      hasf = fixtureUnit.inputUnit.containsKey(efemale);

      if(hasm && hasf){
        fixtureUnit.inputUnit[eperson] = 0;
        hasp = true;
      }else{
        hasp = fixtureUnit.inputUnit.containsKey(eperson);
        
      }
      //===== END MANDATORY ===== 

      allowedSet = fixtureUnit.GetUnitsAllowanceEnum();
      commonInput = Set<table422_1Units>();

      occupantLoadFactor = occupantLoadFactorService.getLoadFactor(fixtureUnit.occupancy.type);
      if(occupantLoadFactor != null){
        hasLoadFactor = true;
      }else{
        hasLoadFactor = false;
      }

      allowedSet.forEach((element) {
        if(element != emale &&
           element != efemale &&
           element != eperson
        ){
          commonInput.add(element);
        }
      });
    }
  }

  bool checkAvailability(){
    if(hasm && hasf){
         return true;
       }
    else if(hasp){
      return true;
    }
    return false;
  }


  void personTriggered(){
    if(hasm) fixtureUnit.inputUnit[efemale] = (fixtureUnit.inputUnit[eperson]/2.0).ceil().toDouble();
    if(hasf) fixtureUnit.inputUnit[emale] = fixtureUnit.inputUnit[eperson] - fixtureUnit.inputUnit[efemale];      
  }

  void maleTriggered(){
    if(hasp && hasf){
      fixtureUnit.inputUnit[eperson] = fixtureUnit.inputUnit[emale] + fixtureUnit.inputUnit[efemale];
    }else if(hasp && hasf){
      if(fixtureUnit.inputUnit[eperson] > fixtureUnit.inputUnit[emale]){
        fixtureUnit.inputUnit[efemale] = fixtureUnit.inputUnit[eperson] - fixtureUnit.inputUnit[emale];
      } else{
      }
    }else if(fixtureUnit.inputUnit[eperson] != null && fixtureUnit.inputUnit[efemale] != null){
      if(fixtureUnit.inputUnit[emale] > fixtureUnit.inputUnit[eperson] || fixtureUnit.inputUnit[efemale] > fixtureUnit.inputUnit[eperson]){
      } else{
        fixtureUnit.inputUnit[efemale] = fixtureUnit.inputUnit[eperson] - fixtureUnit.inputUnit[emale];
      }
    }
  }

  void femaleTriggered(){
    if(fixtureUnit.inputUnit[eperson] == null && fixtureUnit.inputUnit[emale] != null){
      fixtureUnit.inputUnit[eperson] = fixtureUnit.inputUnit[efemale] + fixtureUnit.inputUnit[emale];
    }else if(fixtureUnit.inputUnit[eperson] != null && fixtureUnit.inputUnit[emale] == null){
      if(fixtureUnit.inputUnit[eperson] > fixtureUnit.inputUnit[efemale]){
        fixtureUnit.inputUnit[emale] = fixtureUnit.inputUnit[eperson] - fixtureUnit.inputUnit[efemale];
      } else{
      }
    }else if(fixtureUnit.inputUnit[eperson] != null && fixtureUnit.inputUnit[emale] != null){
      if(fixtureUnit.inputUnit[efemale] > fixtureUnit.inputUnit[eperson] || fixtureUnit.inputUnit[emale] > fixtureUnit.inputUnit[eperson]){
      } else{
        fixtureUnit.inputUnit[emale] = fixtureUnit.inputUnit[eperson] - fixtureUnit.inputUnit[efemale];
      }
    }
  }

  void upDate(){
    if(occupantLoadFactor != null && fixtureUnit.inputUnit.containsKey(eperson)){
      fixtureUnit.inputUnit[eperson] = occupantLoadFactor.persons;
      personTriggered();
    }
  }
}