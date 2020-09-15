import 'package:angular/angular.dart';
import 'package:angular_app/Services/user-information/GoogleLogin/google-login.dart';
import 'package:angular_app/Services/user-information/MicrosoftLogin/microsoft-login.dart';
import 'package:angular_app/Services/user-information/YahooLogin/yahoo-login.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
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

  Future<void> MicrosoftLoginListener() async{
    await MicrosoftLogin.GoToLogin();
  }

  Future<void> GoogleLoginListener() async{
    await GoogleLogin.GoToLogin();
  }

  Future<void> YahooLoginListener() async {
    await YahooLogin.GoToLogin();
  }
}