import 'package:angular/angular.dart';
import 'package:angular_app/Services/user-information/check_user.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:angular_app/routes/routes.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/PatientRoom.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/Pfm.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/user-input-component.dart';

import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/material_select/material_select_dropdown_item.dart';
import 'package:angular_components/material_select/material_dropdown_select_accessor.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/laminate/popup/module.dart';
import 'package:angular_components/material_tooltip/material_tooltip.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';


import 'package:angular_app/Services/type-of-occupancy-service.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';

import 'TotalFixtureRequirements/total-fixture-requirement.dart';

@Component(
    selector:    'minimum-fixtures-required',
    templateUrl: 'minimum-fixtures-required.html',
    styleUrls: [ 
                 'package:angular_components/app_layout/layout.scss.css',
                 'minimum-fixtures-required.css',
                ],
    directives: [
      formDirectives,
      coreDirectives,
      MaterialDropdownSelectComponent,
      MaterialSelectDropdownItemComponent,
      DropdownSelectValueAccessor,

      MaterialTooltipDirective,
      MaterialTooltipTargetDirective,
      MaterialTooltipSourceDirective,

      UserInputBasedOnOccupancy,
      TotalFixtureRequirement,

      MaterialInputComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
      materialInputDirectives,
      materialNumberInputDirectives,
    ],

    providers: [ClassProvider(TypeOfOccupancyService),
    popupBindings,
    ],
)
class MinimumFixtureRequired implements OnInit{
  TypeOfOccupancyService occupancies;
  List<TypeOfOccupancy> typeOfOccupancy;
  TypeOfOccupancy chooseOccupancy;

  // TOP LEVEL -- will be shared among child components.
  FixtureUnit fixtureUnit;
  TotalFacilitiesRequired totalFacilitiesRequired;
  OccupantLoadFactor occupantLoadFactor;

  //Sub classes:
  Pfm gen;
  PatientRoom pt;
  CommonInputList fakemap;
  Router _router;


  String buttonText = "choose occupancy type";


  MinimumFixtureRequired(this.occupancies, this._router){
    totalFacilitiesRequired = TotalFacilitiesRequired();
    occupantLoadFactor = OccupantLoadFactor.Init();
    fixtureUnit = FixtureUnit.Void();

    gen = Pfm.Init();
    gen.fixtureUnit = fixtureUnit;

    pt = PatientRoom.Init();
    pt.fixtureUnit = fixtureUnit;

    fakemap = CommonInputList.Init();
    fakemap.fixtureUnit = fixtureUnit;

  }

  @override
  void ngOnInit() async{
    if(!await CheckUser.IsValidUser()){
      _router.navigate(LoginPaths.loginPage.toUrl());
    }
    typeOfOccupancy = occupancies.getTypeOfOccupancy();
    typeOfOccupancy.forEach((element) {
    });
    // TODO: implement ngOnInit
  }

  getItem(TypeOfOccupancy item){   
    buttonText = item.type;
    chooseOccupancy = item;
    fixtureUnit = FixtureUnit(item);
    gen = Pfm(fixtureUnit);
    pt = PatientRoom(fixtureUnit);
    fakemap = CommonInputList(fixtureUnit);
    occupantLoadFactor.gen = gen;

  }

  addFixture(){
    if(fixtureUnit != null && fixtureUnit.IsAddable()){
      totalFacilitiesRequired.AddFixtureOccupancy(fixtureUnit);
      totalFacilitiesRequired.Recalculate();
    }
  }
}