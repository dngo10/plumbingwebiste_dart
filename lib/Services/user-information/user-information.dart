import 'package:angular_app/Services/user-information/GoogleLogin/google-login.dart';
import 'package:angular_app/Services/user-information/MicrosoftLogin/microsoft-login.dart';
import 'package:angular_app/Services/user-information/YahooLogin/yahoo-login.dart';
import 'package:angular_router/angular_router.dart';

enum oauth2Vendor{
  google,
  microsoft,
  yahoo
}

class UserInformation{
  static String serverhost = "http://localhost:4040";
  static oauth2Vendor vendor; 
  static String givenName;
  static String email;
  static String authorizationCode;
  static String expiredTime;
  static String previousUrl;
  static String status;

  static Future<void> logout() async{
    oauth2Vendor currentVendor = UserInformation.vendor;
    if(currentVendor != null){
      if(currentVendor == oauth2Vendor.google){
        await GoogleLogin.Logout();
      } else if(currentVendor == oauth2Vendor.yahoo){
        await YahooLogin.Logout();
      } else if(currentVendor == oauth2Vendor.microsoft){
        await MicrosoftLogin.Logout();
      }
    }  
  }

  static Future<void> GetUserInformation(Router router) async{
    oauth2Vendor currentVendor = UserInformation.vendor;
    if(currentVendor == oauth2Vendor.google){
      GoogleLogin.GetUserInformation(router);
    }else if(currentVendor == oauth2Vendor.yahoo){
      YahooLogin.GetUserInformation(router);
    }else if(currentVendor == oauth2Vendor.microsoft){
      MicrosoftLogin.GetUserInformation(router);
    }
  }
}