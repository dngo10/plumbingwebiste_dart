import '../../routes/route_path.dart';

class MicrosoftLoginControl{

  List<String> _tenant = ['common', 'organization', 'consumers'];
  String baseLink;
  String _clientID = '2e5c8071-b2ca-4f40-a765-76942bf5edcb';
  String redirectUri = '/#' + RoutePathPlumbing.loginPage.toUrl();

  MicrosoftLoginControl(){
    baseLink = 'https://login.microsoftonline.com/${_tenant[0]}/oauth2/v2.0/authorize?';
    baseLink += 'client_id=${_clientID}';
    baseLink += '&response_type=code';
    baseLink += '&redirect_uri="${redirectUri}"';
    baseLink += '&scope=openid email profile offline_access';
    baseLink += '&response_mode=query';
    baseLink += '&state=12345';
  }
  
}