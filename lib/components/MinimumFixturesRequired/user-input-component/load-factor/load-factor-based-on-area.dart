import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/male-female-input/male-female-input.dart';

import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

@Component(
  selector: 'load-factor-based-on-area',
  templateUrl: 'load-factor-based-on-area.html',
  styleUrls: ['load-factor-based-on-area.css',
              'package:angular_components/app_layout/layout.scss.css'
  ],
  directives: [coreDirectives,
               formDirectives,
               MaterialInputComponent,
               MaterialFabComponent,
               MaterialIconComponent,
               materialInputDirectives,
               materialNumberInputDirectives,
               MaterialToggleComponent,
  ],
  providers: [ClassProvider(OccupantLoadFactorService)]
)
class LoadFactorBasedOnArea implements AfterChanges { 
  
  @Input() OccupantLoadFactor occupantLoadFactor;

  OccupantLoadFactorService loadProviderService;
  String toggleLabel = "Use Load Factor?";
  bool hasLoadFactor = false;
  bool _usingSlider = false ;

  bool get usingSlider{return _usingSlider;}
  void set usingSlider(bool value){
    _usingSlider = value;
    if(_usingSlider == false){
      if(occupantLoadFactor != null && occupantLoadFactor.gen != null){
        occupantLoadFactor.gen.person = 0;
        occupantLoadFactor.areaEntered = 0;
        occupantLoadFactor.GetPersonsOutOfLoadFactor();
      }
    }
  }

  LoadFactorBasedOnArea(this.loadProviderService){
    _usingSlider = false;
  }

  @override
  void ngAfterChanges() {
    
    _usingSlider = false;

    if(occupantLoadFactor != null && occupantLoadFactor.gen != null){
      
      if(occupantLoadFactor != null){
        hasLoadFactor = true;
      }else{
        hasLoadFactor = false;
      }

    }
  }
}