import 'package:angular/angular.dart';

import 'package:angular_components/app_layout/material_stackable_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

@Component(
  selector: 'top-bar',
  templateUrl: 'top-bar.html',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'top-bar.css'],
   directives: [
    coreDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialStackableDrawerComponent,
    MaterialToggleComponent,
  ],
)
class TopBar{
  bool end = false;
  bool overlay = false;

  bool drawerVisible = false;
  bool drawer2Visible = false;
}