import 'package:angular_app/Services/user-information/user-information.dart';

class UserTopBar{

  String get email{
    return UserInformation.email;
  }

  String get userName{
    return UserInformation.givenName;
  }
}