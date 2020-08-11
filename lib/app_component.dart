import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_components/app_layout/material_stackable_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_radio/material_radio.dart';
import 'package:angular_components/material_radio/material_radio_group.dart';

import 'components/topBar/top-bar.dart';

import 'routes/routes.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialStackableDrawerComponent,
    MaterialToggleComponent,
    coreDirectives,
    formDirectives,
    MaterialInputComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialButtonComponent,
    materialInputDirectives,
    materialNumberInputDirectives,

    TopBar,
  ],
  exports: [RoutePathPlumbing, Routes,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialStackableDrawerComponent,
    MaterialToggleComponent,
    coreDirectives,
    formDirectives,
    MaterialInputComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialButtonComponent,
    materialInputDirectives,
    materialNumberInputDirectives,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
  ],
  styleUrls:[
    'app_component.css',
    'package:angular_components/app_layout/layout.scss.css'],
)
class AppComponent {
  var name = 'Angular';
}
