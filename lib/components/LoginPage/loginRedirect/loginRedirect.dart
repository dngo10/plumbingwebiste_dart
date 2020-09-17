import 'package:angular/angular.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
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
  Future<void> onActivate(_, RouterState current) async{
    await UserInformation.GetUserInformation(_router);

    if(UserInformation.status == null ||
        UserInformation.status != "ok" ||
        UserInformation.email == null
        ){
      _router.navigate(LoginPaths.loginPage.toUrl());
    }else{
      _router.navigate(RoutePathPlumbing.minimumFixtureRequired.toUrl());
    }
    
  }
}