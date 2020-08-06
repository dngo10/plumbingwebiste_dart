import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
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
import 'package:angular_forms/angular_forms.dart';
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

  String var1 = "choose occupancy type";


  MinimumFixtureRequired(this.occupancies){}

  @override
  void ngOnInit() {
    totalFacilitiesRequired = TotalFacilitiesRequired();
    typeOfOccupancy = occupancies.getTypeOfOccupancy();
    typeOfOccupancy.forEach((element) {
    });
    // TODO: implement ngOnInit
  }

  getItem(TypeOfOccupancy item){
    var1 = item.type;
    chooseOccupancy = item;
    fixtureUnit = FixtureUnit(chooseOccupancy);
  }

  addFixture(){
    if(fixtureUnit != null && fixtureUnit.IsAddable()){
      totalFacilitiesRequired.AddFixtureOccupancy(fixtureUnit);
      totalFacilitiesRequired.Recalculate();
    }
  }

}