import 'package:angular_router/angular_router.dart';


class RoutePathPlumbing{
  static String idParam = 'id';
  static final minimumFixtureRequired = RoutePath(path: 'minimumfixturerequirement');
  static final minimumFixtureRequiredData = RoutePath(path: '${minimumFixtureRequired.path}?id=:$idParam');
}

class LoginPaths{
  static final String result = "code";
  static final loginPage = RoutePath(path: 'login');
  static final loginPageRedirect = RoutePath(path: ''); // THIS IS REALLY STUPID, THANKS ANGULAR DART
  // The colon (:) in the path indicates that (:result) is a place holder

  static String getCode(Map<String, String> parameters){
    final String id = parameters['code'];
    return id;
  }
}