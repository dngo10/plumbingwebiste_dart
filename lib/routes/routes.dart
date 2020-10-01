import 'package:angular_router/angular_router.dart';
import '../routes/route_path.dart';
import '../components/MinimumFixturesRequired/minimum-fixtures-required.template.dart' as min_fixture;
import '../components/LoginPage/login-page.template.dart' as login_page;
import '../components/LoginPage/loginRedirect/loginRedirect.template.dart' as login_redirect; 

export '../routes/route_path.dart';


class Routes{
  static final minFixture = RouteDefinition(
    routePath: RoutePathPlumbing.minimumFixtureRequired,
    component: min_fixture.MinimumFixtureRequiredNgFactory, 
  );

  static final login = RouteDefinition(
    routePath: LoginPaths.loginPage,
    component: login_page.LoginPageNgFactory,
  );

  static final loginRedirect = RouteDefinition(
    routePath: LoginPaths.loginPageRedirect,
    component: login_redirect.LoginRedirectNgFactory,
  );

  static final minFixtureData = RouteDefinition(
    routePath: RoutePathPlumbing.minimumFixtureRequiredData,
    component: min_fixture.MinimumFixtureRequiredNgFactory,
  );

    static final all = <RouteDefinition>[
      //RouteDefinition.redirect(
      //  path: '',
      //  redirectTo: LoginPaths.loginPageRedirect.toUrl(),
      //),
      
      minFixture,
      login,
      loginRedirect,
    ];
}