import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';
import 'package:angular_app/components/MinimumFixturesRequired/fixture-unit-result/fixture-unit-result.dart';
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

  //class below
  Pfm gen;

  double area =  0;

  //Map<table422_1Units, double> amountReturn;
  Set<table422_1Units> commonInput;

  var unitMap;

  var emale = table422_1Units.male;
  var efemale = table422_1Units.female;
  var eperson = table422_1Units.person;

  bool hasp = false; // has person in fixture unit
  bool hasm = false; // has male in fixture unit
  bool hasf = false; // has female in fixture unit




  MaleFemaleInput(this.occupantLoadFactorService){}

  Map<String, bool>  currentClasses;

  //double male = 0, female = 0, person = 0;
  OccupantLoadFactorService occupantLoadFactorService;
  OccupantLoadFactor occupantLoadFactor;

  bool hasLoadFactor = false;

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
      gen = Pfm(fixtureUnit);

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
    if(hasm) gen.female = (gen.person/2.0).ceil().toDouble();
    if(hasf) gen.male = gen.person - gen.female;      
  }

  void maleTriggered(){
    if(hasp && hasf){
      gen.person = gen.male + gen.female;
    }else if(hasp && hasf){
      if(gen.person > gen.male){
        gen.female = gen.person - gen.male;
      } else{
      }
    }else if(gen.person != null && gen.female != null){
      if(gen.male > gen.person || gen.female > gen.person){
      } else{
        gen.female = gen.person - gen.male;
      }
    }
  }

  void femaleTriggered(){
    if(gen.person == null && gen.male != null){
      gen.person = gen.female + gen.male;
    }else if(gen.person != null && gen.male == null){
      if(gen.person > gen.female){
        gen.male = gen.person - gen.female;
      } else{
      }
    }else if(gen.person != null && gen.male != null){
      if(gen.female > gen.person || gen.male > gen.person){
      } else{
        gen.male = gen.person - gen.female;
      }
    }
  }


  void upDate(){
    if(occupantLoadFactor != null && fixtureUnit.inputUnit.containsKey(eperson)){
      gen.person = occupantLoadFactor.persons;
      personTriggered();
    }
  }
}

/// Person - Male -Female class, use it to do binary binding
class Pfm{
  double _male = 0, _female = 0, _person = 0;
  FixtureUnit fixtureUnit;

  Pfm(this.fixtureUnit);

  var emale = table422_1Units.male;
  var efemale = table422_1Units.female;
  var eperson = table422_1Units.person;

  double get male{return _male;}
  double get female{return _female;}
  double get person{return _person;}

  // This folder is intended for setting male, female, person.
  void set male(double value){
    if(value != null && value >= 0 && _male != value){
      _male = value;
      if(fixtureUnit != null){
         fixtureUnit.inputUnit[emale] = _male;
         fixtureUnit.Recalculate();
      }
    }
  }

  void set female(double value){
    if(value != null && value >= 0 && _female != value){
      _female = value;
      if(fixtureUnit != null){
         fixtureUnit.inputUnit[efemale] = _female;
         fixtureUnit.Recalculate();
      }
    }
  }

  void set person(double value){
    if(value != null && value >= 0 && _female != value){
      _person = value;
      if(fixtureUnit != null){
         fixtureUnit.inputUnit[eperson] = _person;
         fixtureUnit.Recalculate();
      }
    }
  }
  
}