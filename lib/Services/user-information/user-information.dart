import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:angular_app/routes/route_path.dart';
import 'package:angular_router/angular_router.dart';
import 'dart:convert';

enum cookiesValue{
  authorizationCode,

}

class UserInformation{
  static String givenName;
  static String email;
  static String authorizationCode;
  static String expiredTime;
  static String previousUrl;

  static String _tenant = "common";
  static String _clientID = "0c0b0622-f612-41a6-874c-b5182b5183f1";
  static List<String> _action = ["authorize", "logout"];
  static String _domain = "https://gouvisgroup.xyz";
  static String _host = "https://login.microsoftonline.com/${_tenant}/oauth2/v2.0/${_action[0]}?";
  static String _redirect_url = "https://gouvisgroup.xyz/";
  static String _redirect_url1 = "http://localhost:8080/";
  static String _code = "code";

  static String _serverHost = "http://localhost:4040";
  static String _serverAuth2 = "${_serverHost}/oauth2";
  static String _serverLogout = "${_serverHost}/logout";

  static Future<void> GoToLogin() async{
    String baseLink = _host;
    baseLink += 'client_id=${_clientID}';
    baseLink += '&response_type=code';
    baseLink += '&scope=openid email profile offline_access https://graph.microsoft.com/user.read';
    baseLink += '&redirect_uri=${_redirect_url1}';
    baseLink += '&response_mode=query';
    baseLink += '&state=12345';  
    html.window.location.href = baseLink;
  }

  // GET https://login.microsoftonline.com/common/oauth2/v2.0/logout?
  // post_logout_redirect_uri=http%3A%2F%2Flocalhost%2Fmyapp%2F

  //https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-protocols-oidc

  static String GoToLogout(){
    String baseLink = 'https://login.microsoftonline.com/common/oauth2/v2.0/logout?';
    baseLink += "post_logout_redirect_uri=${_redirect_url1}";
    return baseLink;
  }

  static Future<void> GetUserInformation(Router router) async{
    Uri url = Uri.parse(html.window.location.href);
    Map<String,String> map = url.queryParameters;
    if(map == null || map.length == 0 || !map.containsKey(_code)){
      router.navigate(LoginPaths.loginPage.toUrl());
    }else{
      authorizationCode = map[_code];
      http.Response reponse = await http.post(_serverAuth2, body: json.encode(map));
      Map data = json.decode(reponse.body);
      if(data != null && data["status"] == "ok"){
        email = data["email"];
        givenName = data["displayName"];
      }
    }
  }

  static Future<void> Logout() async{
    http.Response response = await http.post(_serverLogout,
    body: {
      "code": UserInformation.authorizationCode
    }
    );
    email = null;
    givenName = null;
    authorizationCode = null;
    html.window.location.href = GoToLogout();
    clearcookies();
  }

  static bool isValid(){
    return false;
  }

  static void clearcookies(){
    
  }

}