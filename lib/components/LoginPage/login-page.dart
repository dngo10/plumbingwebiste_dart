import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/LoginControl/MicrosoftLoginControl.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_app/routes/route_path.dart';
import 'dart:html' as html;

@Component(
  selector: 'login-page-app',
  styleUrls: [
    'login-page.css',
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
  ],
  templateUrl: 'login-page.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    coreDirectives,
  ],


)
class LoginPage{

  void goToPage(){
    String temp = '/#' + RoutePathPlumbing.minimumFixtureRequired.toUrl();
    html.window.location.href= temp;
    print(temp);
  }

  void goToMicrosoftLogin(){
    MicrosoftLoginControl ms = MicrosoftLoginControl();
    print(ms.baseLink);
    //print(ms.baseLink);
    html.window.location.href = ms.baseLink;
  }
}