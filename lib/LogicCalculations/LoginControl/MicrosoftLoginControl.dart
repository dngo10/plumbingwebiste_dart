import '../../routes/route_path.dart';
import 'dart:html';

class MicrosoftLoginControl{

  String host = window.location.hostname;
  List<String> _tenant = ['common', 'organization', 'consumers'];
  String baseLink;
  String _clientID = '2e5c8071-b2ca-4f40-a765-76942bf5edcb';
  String redirectUri;

  MicrosoftLoginControl(){
    String port = '';
    if(host == 'localhost'){
      port = ':8080';
    }


    redirectUri = 'http://' + host + port + '/#' + LoginPaths.loginPage.toUrl();
    print(LoginPaths.loginPage.toUrl());
    baseLink = 'https://login.microsoftonline.com/${_tenant[0]}/oauth2/v2.0/authorize?';
    baseLink += 'client_id=${_clientID}';
    baseLink += '&response_type=code';
    baseLink += '&scope=openid email profile offline_access';
    //baseLink += '&redirect_uri=${redirectUri}';
    baseLink += '&response_mode=query';
    baseLink += '&state=12345';
  }
  
}