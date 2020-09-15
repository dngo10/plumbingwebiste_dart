import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:angular_router/angular_router.dart';
import '../../../routes/route_path.dart';

class YahooLogin{
  static String _baseUrl = 'https://api.login.yahoo.com/oauth2/request_auth?';
  static String _client_id = "dj0yJmk9Snk0aHdEZVNKRDBDJmQ9WVdrOVVVaHpTM050TjNNbWNHbzlNQT09JnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTll";
  static String _response_type = "code";
  static String _redirect_uri = Uri.encodeFull("https://gouvisgroup.xyz");
  static String _language = "en-us";

  static String _server_login =  "${UserInformation.serverhost}/yahoo/login";
  static String _server_logout = "${UserInformation.serverhost}/yahoo/logout";

  static String _getLoginUrl(){
    String url = _baseUrl;
    url += "client_id=${_client_id}&";
    url += "response_type=${_response_type}&";
    url += "redirect_uri=${_redirect_uri}&";
    url += "language=${_language}";

    return url;
  }

  static void GoToLogin(){
    UserInformation.vendor = oauth2Vendor.yahoo;
    html.window.location.href = _getLoginUrl();
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
    UserInformation.vendor = null;
  }

  static Future<void> GetUserInformation(Router router) async{
    Uri url = Uri.parse(html.window.location.href);
    Map<String,String> map = url.queryParameters;
    if(map == null || map.length == 0 || !map.containsKey(_response_type)){
      router.navigate(LoginPaths.loginPage.toUrl());
    }else{
      UserInformation.authorizationCode = map[_response_type];
      http.Response reponse = await http.post(_server_login, body: jsonEncode(map));
      Map data = jsonDecode(reponse.body);
      if(data != null ){
        UserInformation.status = data["status"];
        if(data["status"] == "ok"){
          UserInformation.email = data["email"];
          UserInformation.givenName = data["displayName"];
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