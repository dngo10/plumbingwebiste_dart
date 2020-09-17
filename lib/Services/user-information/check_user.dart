import 'dart:convert';

import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:http/http.dart' as http;

class CheckUser{
  static Future<bool> IsValidUser() async{
    String url = UserInformation.serverhost + "/check_user?code=${UserInformation.authorizationCode}";

    http.Response response = await http.get(url);
    Map map = jsonDecode(response.body);
    if(map["status"] != "ok"){
      return false;
    }
    return true;
  }
}