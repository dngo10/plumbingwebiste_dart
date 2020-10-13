import 'dart:convert';

import 'package:angular_app/Services/local-storage-manager/local-storage-manager.dart';
import 'package:angular_app/routes/route_path.dart';
import 'package:angular_router/angular_router.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import '../../../routes/route_path.dart';
import 'package:angular_app/Services/user-information/user-information.dart';


class GoogleLogin{

  static String _baseUrl = 'https://accounts.google.com/o/oauth2/v2/auth?';
  static String _clientId = '990439782684-t224hulo9aegba964mqluborhhckhi5r.apps.googleusercontent.com';
  static String _redirectUri = UserInformation.redirectUri;
  static String _response_type = 'code';
  static String _access_type = 'offline';
  static String _scope = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile';

  static String _server_login = '${UserInformation.serverhost}/oauth2'; 
  static String _server_logout = '${UserInformation.serverhost}/oauth2';

  static String _loginUrl(){
    String url = "${_baseUrl}";
    url += "scope=${_scope}&";
    url += "access_type=${_access_type}&";
    url += "response_type=${_response_type}&";
    url += "redirect_uri=${_redirectUri}&";
    url += "client_id=${_clientId}";
    return url;
  }

  static Future<void> GetUserInformation(Router router) async{
    Uri url = Uri.parse(html.window.location.href);
    Map<String,String> map = url.queryParameters;
    if(map == null || map.length == 0 || !map.containsKey(_response_type)){
      await router.navigate(LoginPaths.loginPage.toUrl());
    }else{
      UserInformation.authorizationCode = map[_response_type];

      // MUST SPECIFY THIS
      Map accessMap = Map.from(map);
      accessMap["vendor"] = "google";
      accessMap["redirect_uri"] = UserInformation.redirectUri;
      http.Response reponse = await http.post(_server_login, body: jsonEncode(accessMap));
      Map data = jsonDecode(reponse.body);
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

  static void GoToLogin(){
    UserInformation.vendor = "google";
    html.window.location.href = _loginUrl();
  }

  static void _goToLogout(){
    // There is no logout for Google... damn this company...


  }

  static void Logout() async{
    await http.post(_server_logout,
    body: {
      "code": UserInformation.authorizationCode
    }
    );
    UserInformation.email = null;
    UserInformation.givenName = null;
    UserInformation.authorizationCode = null;

    //html.window.location.href = _goToLogout();      
  }


}