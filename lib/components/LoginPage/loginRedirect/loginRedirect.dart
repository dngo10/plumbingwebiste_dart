import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_app/components/LoginPage/login-page.dart';
import 'package:angular_app/routes/route_path.dart';
import 'package:angular_router/angular_router.dart';


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
    Uri url = Uri.parse(window.location.href);
    map = url.queryParameters;

    print(map['code']);
    if(map == null || map.length == 0){
      _router.navigate(LoginPaths.loginPage.toUrl());
    }
  }
}