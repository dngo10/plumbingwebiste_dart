import 'package:angular/angular.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/user-input-component.dart';

import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/material_select/material_select_dropdown_item.dart';
import 'package:angular_components/material_select/material_dropdown_select_accessor.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/laminate/popup/module.dart';
import 'package:angular_components/material_tooltip/material_tooltip.dart';

import 'package:angular_app/Services/type-of-occupancy-service.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';

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
    ],

    providers: [ClassProvider(TypeOfOccupancyService),
    popupBindings,
    ],
)
class MinimumFixtureRequired implements OnInit{
  TypeOfOccupancyService occupancies;
  List<TypeOfOccupancy> typeOfOccupancy;
  TypeOfOccupancy chooseOccupancy;

  String var1 = "__";


  MinimumFixtureRequired(this.occupancies){}

  @override
  void ngOnInit() {
    typeOfOccupancy = occupancies.getTypeOfOccupancy();
    typeOfOccupancy.forEach((element) {
    });
    // TODO: implement ngOnInit
  }

  runthis(TypeOfOccupancy item){
    var1 = item.type;
    chooseOccupancy = item;
  }

}