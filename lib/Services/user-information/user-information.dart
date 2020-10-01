import 'dart:convert';
import 'dart:html';

import 'package:angular_app/Services/local-storage-manager/local-storage-manager.dart';
import 'package:angular_app/Services/user-information/GoogleLogin/google-login.dart';
import 'package:angular_app/Services/user-information/MicrosoftLogin/microsoft-login.dart';
import 'package:angular_app/Services/user-information/YahooLogin/yahoo-login.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;

class UserInformation{
  static const String serverhost = "http://localhost:4040";

  static void set givenName(String value){return LocalStorageManager.addToStorage(_givenName, value);}
  static String get givenName {return LocalStorageManager.getValue(_givenName);}

  static void set email(String value){return LocalStorageManager.addToStorage(_email, value);}
  static String get email{return LocalStorageManager.getValue(_email);}

  static void set authorizationCode(String value){return LocalStorageManager.addToStorage(_authorizationCode, value);}
  static String get authorizationCode{return LocalStorageManager.getValue(_authorizationCode);}

  static void set expiredTime(String value){return LocalStorageManager.addToStorage(_expiredTime, value);}
  static String get expiredTime{return LocalStorageManager.getValue(_expiredTime);}

  static void set previousUrl(String value){return LocalStorageManager.addToStorage(_previousUrl, value);}
  static String get previousUrl{return LocalStorageManager.getValue(_previousUrl);}

  static void set vendor(String value){return LocalStorageManager.addToStorage(_vendor, value);}
  static String get vendor{return LocalStorageManager.getValue(_vendor);}

  static void set code(String value){return LocalStorageManager.addToStorage(_code, value);}
  static String get code{return LocalStorageManager.getValue(_code);}

  static void set status(String value){return LocalStorageManager.addToStorage(_status, value);}
  static String get status{return LocalStorageManager.getValue(_status);}

  static const String _vendor = "GV_vendor";
  static const String _code = "GV_code";
  static const String _givenName = "GV_givenName";
  static const String _email = "GV_email";
  static const String _authorizationCode = "GV_authorizationCode";
  static const String _status = "GV_status";
  static const String _expiredTime = "GV_expiredTime";
  static const String _previousUrl = "GV_previousUrl";

  static Future<void> logout() async{
    String currentVendor = UserInformation.vendor;
    _logOutFromServer();

    //Logout from vendor
    if(currentVendor != null){
      if(currentVendor == "google"){
        await GoogleLogin.Logout();
      } else if(currentVendor == "yahoo"){
        await YahooLogin.Logout();
      } else if(currentVendor == "microsoft"){
        await MicrosoftLogin.Logout();
      }

      LocalStorageManager.deleteValue(UserInformation.vendor);
      LocalStorageManager.deleteValue(UserInformation.code);
      LocalStorageManager.deleteValue(UserInformation.previousUrl);
      //window.location.href = 

    }
  }

  static Future<void> GetUserInformation(Router router) async{
    String currentVendor = UserInformation.vendor;
    if(currentVendor != null){
      if(currentVendor == "google"){
        await GoogleLogin.GetUserInformation(router);
      }else if(currentVendor == "yahoo"){
        await YahooLogin.GetUserInformation(router);
      }else if(currentVendor == "microsoft"){
        await MicrosoftLogin.GetUserInformation(router);
      }
    }
  }

  static Future<void> _logOutFromServer() async{
    String logoutUrl = serverhost + "/logout";
    http.Response response = await http.post(logoutUrl,
      body: _createLogOutBody(),
    );

    print(response.body);
    return true;
    //Command to delete local server
  }

  static String _createLogOutBody(){
    Map map = {
      "code": UserInformation.authorizationCode,
      "vendor" : LocalStorageManager.getValue(UserInformation.vendor)
    };

    return jsonEncode(map);
  }
}