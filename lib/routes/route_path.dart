import 'package:angular_router/angular_router.dart';


class RoutePathPlumbing{
  static final minimumFixtureRequired = RoutePath(path: 'minimumfixturerequirement');
}

class LoginPaths{
  static final String result = "code";
  static final loginPage = RoutePath(path: 'login');
  static final loginPageRedirect = RoutePath(path: '');
  // The colon (:) in the path indicates that (:result) is a place holder

  static String getCode(Map<String, String> parameters){
    print(parameters);
    final String id = parameters['code'];
    return id;
  }
}