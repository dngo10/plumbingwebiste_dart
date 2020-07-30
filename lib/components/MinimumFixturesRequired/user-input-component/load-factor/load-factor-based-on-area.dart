import 'package:angular/angular.dart';

import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';

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
  ]
)
class LoadFactorBasedOnArea{
  
}