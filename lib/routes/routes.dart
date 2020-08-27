import 'package:angular_router/angular_router.dart';
import '../routes/route_path.dart';
import '../components/MinimumFixturesRequired/minimum-fixtures-required.template.dart' as min_fixture;
import '../components/LoginPage/login-page.template.dart' as login_page;

export '../routes/route_path.dart';


class Routes{
  static final minFixture = RouteDefinition(
    routePath: RoutePathPlumbing.minimumFixtureRequired,
    component: min_fixture.MinimumFixtureRequiredNgFactory, 
  );

  static final login = RouteDefinition(
    routePath: RoutePathPlumbing.loginPage,
    component: login_page.LoginPageNgFactory,
  );

    static final all = <RouteDefinition>[
      RouteDefinition.redirect(
        path: '',
        redirectTo: RoutePathPlumbing.loginPage.toUrl(),
      ),
      
      minFixture,
      login,


    ];
}