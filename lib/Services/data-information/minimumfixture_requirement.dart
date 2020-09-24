import 'dart:convert';
import 'dart:html';
import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:http/http.dart' as http;

/// THIS CLASS ONLY SERVER GET/PUSH DATA
/// 

class MinimumFixtureData{
  Future<void> GetValue(DataHeaders dataHeaders) async{
    String url = UserInformation.serverhost + "/data";
    url += "?code=${dataHeaders.code}&";
    url += "?id=${dataHeaders.id}";
    http.Response response = await http.post(url);
    Map temp = jsonDecode(response.body);
    if(temp.containsKey("DATA")){
      // DO SOMETHING HERE
    }

  }
}

class DataHeaders{
  String code;
  int id;
}