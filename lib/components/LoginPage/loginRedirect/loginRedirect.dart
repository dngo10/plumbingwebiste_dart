import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:angular_app/routes/route_path.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;


@Component(
  selector: 'login-redirect-app',
  templateUrl: 'loginRedirect.html',
  styleUrls: [
    'loginRedirect.css'
  ]
)
class  LoginRedirect implements OnActivate {
  Router _router;
  
  LoginRedirect(this._router);

  Map<String,String> map;

  @override
  void onActivate(_, RouterState current) async{
    await UserInformation.GetUserInformation(_router);
    _router.navigate(RoutePathPlumbing.minimumFixtureRequired.toUrl());
  }
}