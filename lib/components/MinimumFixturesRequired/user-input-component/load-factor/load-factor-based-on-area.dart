import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/Services/occupant-load-factor-service.dart';

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
class LoadFactorBasedOnArea implements AfterChanges, AfterContentChecked {

  final _occupantLoadFactor = StreamController<OccupantLoadFactor>();
  @Output() Stream<OccupantLoadFactor> get areaOutput => _occupantLoadFactor.stream; 
  
  @Input() OccupantLoadFactor occupantLoadFactor;
  @Input() double person;

  OccupantLoadFactorService loadProviderService;
  String toggleLabel = "Use Load Factor?";
  bool hasLoadFactor = false;
  bool usingSlider = false ;

  LoadFactorBasedOnArea(this.loadProviderService){
    usingSlider = false;
  }

  @override
  void ngAfterChanges() {
    

    if(occupantLoadFactor != null){
      
      if(occupantLoadFactor != null){
        hasLoadFactor = true;
      }else{
        hasLoadFactor = false;
      }
    }
  }

  @override
  void ngAfterContentChecked() {
    if(usingSlider && occupantLoadFactor != null){
      occupantLoadFactor.GetPersonsOutOfLoadFactor();
    }else{
      if(occupantLoadFactor != null){
        occupantLoadFactor.areaEntered = 0;
        occupantLoadFactor.persons = 0;
      }
    }
  }
}