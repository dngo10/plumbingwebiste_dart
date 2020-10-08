import 'dart:convert';
import 'dart:html' as html;
import 'package:angular_app/Services/local-storage-manager/local-storage-manager.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:http/http.dart' as http;
import 'package:angular_router/angular_router.dart';
import '../../../routes/route_path.dart';

class MicrosoftLogin{
  static String _client_id = '0c0b0622-f612-41a6-874c-b5182b5183f1';
  static String _redirect_url = UserInformation.redirectUri;
  static String _code = "code";
  static String _server_logout = "${UserInformation.serverhost}/logout";
  static String _server_login = "${UserInformation.serverhost}/oauth2";
  
  static String _loginUrl(){
    String _tenant = "common";
    List<String> _action = ["authorize", "logout"];
    String baseUrl = 'https://login.microsoftonline.com/${_tenant}/oauth2/v2.0/${_action[0]}?';
    String url = baseUrl;
    url += 'client_id=${_client_id}';
    url += '&response_type=code';
    url += '&scope=openid email profile offline_access https://graph.microsoft.com/user.read';
    url += '&redirect_uri=${_redirect_url}';
    url += '&response_mode=query';
    url += '&state=12345';  
    return url;
  }

  static Future<void> GoToLogin() async{
    UserInformation.vendor = "microsoft";
    html.window.location.href = _loginUrl();
  }

  static String _goToLogout(){
    String url = 'https://login.microsoftonline.com/common/oauth2/v2.0/logout?';
    url += "post_logout_redirect_uri=${_redirect_url}";
    return url; 
  }

  static Future<void> Logout() async{
    await http.post(_server_logout,
    body: {
      "code": UserInformation.authorizationCode
    }
    );
    UserInformation.email = null;
    UserInformation.givenName = null;
    UserInformation.authorizationCode = null;
    html.window.location.href = _goToLogout();   
  }

  static Future<void> GetUserInformation(Router router) async{
    Uri url = Uri.parse(html.window.location.href);
    Map<String,String> map = url.queryParameters;
    if(map == null || map.length == 0 || !map.containsKey(_code)){
      router.navigate(LoginPaths.loginPage.toUrl());
    }else{
      UserInformation.authorizationCode = map[_code];
      LocalStorageManager.addToStorage(UserInformation.code, map[_code]);
      Map accessMap = Map.from(map);

      //MUST SPECIFY THIS
      accessMap["vendor"] = "microsoft";      
      http.Response reponse = await http.post(_server_login, body: json.encode(accessMap));
      Map data = jsonDecode(reponse.body);
      print(reponse.body);
      if(data != null ){
        UserInformation.status = data["status"];
        if(data["status"] == "ok"){
          UserInformation.email = data["email"];
          UserInformation.givenName = data["name"];
        }else{
          //print(email);
          await Logout();
        }
      }else{
        UserInformation.status = "failed";
      }
    }
  }
}