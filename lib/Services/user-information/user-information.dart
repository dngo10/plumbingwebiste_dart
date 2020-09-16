import 'package:angular_app/Services/local-storage-manager/local-storage-manager.dart';
import 'package:angular_app/Services/user-information/GoogleLogin/google-login.dart';
import 'package:angular_app/Services/user-information/MicrosoftLogin/microsoft-login.dart';
import 'package:angular_app/Services/user-information/YahooLogin/yahoo-login.dart';
import 'package:angular_router/angular_router.dart';

class UserInformation{
  static const String serverhost = "http://localhost:4040";
  static String givenName;
  static String email;
  static String authorizationCode;
  static String expiredTime;
  static String previousUrl;
  static String status;
  static const String vendor = "GV_vendor";

  static Future<void> logout() async{
    String currentVendor = UserInformation.vendor;
    if(currentVendor != null){
      if(currentVendor == "google"){
        await GoogleLogin.Logout();
      } else if(currentVendor == "yahoo"){
        await YahooLogin.Logout();
      } else if(currentVendor == "microsoft"){
        await MicrosoftLogin.Logout();
      }
      LocalStorageManager.deleteValue(UserInformation.vendor);
    }
  }

  static Future<void> GetUserInformation(Router router) async{
    String currentVendor = LocalStorageManager.getValue(vendor);
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
}