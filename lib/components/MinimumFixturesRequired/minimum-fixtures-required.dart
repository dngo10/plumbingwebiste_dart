import 'dart:convert';

import 'package:http/http.dart' as  http;
import 'dart:html' as html;
import 'package:angular/angular.dart';
import 'package:angular_app/Services/user-information/check_user.dart';
import 'package:angular_app/Services/user-information/user-information.dart';
import 'package:angular_app/routes/routes.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/Interfaces/occupant-load-factor.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/PatientRoom.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/Pfm.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/common-input.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_app/components/MinimumFixturesRequired/user-input-component/user-input-component.dart';

import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/material_select/material_select_dropdown_item.dart';
import 'package:angular_components/material_select/material_dropdown_select_accessor.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/laminate/popup/module.dart';
import 'package:angular_components/material_tooltip/material_tooltip.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';


import 'package:angular_app/Services/type-of-occupancy-service.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';

import 'TotalFixtureRequirements/total-fixture-requirement.dart';

@Component(
    selector:    'minimum-fixtures-required',
    templateUrl: 'minimum-fixtures-required.html',
    styleUrls: [ 
                 'package:angular_components/app_layout/layout.scss.css',
                 'minimum-fixtures-required.css',
                ],
    directives: [
      formDirectives,
      coreDirectives,
      MaterialDropdownSelectComponent,
      MaterialSelectDropdownItemComponent,
      DropdownSelectValueAccessor,

      MaterialTooltipDirective,
      MaterialTooltipTargetDirective,
      MaterialTooltipSourceDirective,

      UserInputBasedOnOccupancy,
      TotalFixtureRequirement,

      MaterialInputComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
      materialInputDirectives,
      materialNumberInputDirectives,
    ],

    providers: [ClassProvider(TypeOfOccupancyService),
    popupBindings,
    ],
)
class MinimumFixtureRequired implements OnInit{
  int id = -1;
  TypeOfOccupancyService occupancies;
  List<TypeOfOccupancy> typeOfOccupancy;
  TypeOfOccupancy chooseOccupancy;

  // TOP LEVEL -- will be shared among child components.
  FixtureUnit fixtureUnit;
  TotalFacilitiesRequired totalFacilitiesRequired;
  OccupantLoadFactor occupantLoadFactor;

  //Sub classes:
  Pfm gen;
  PatientRoom pt;
  CommonInputList fakemap;
  Router _router;

  String buttonText = "choose occupancy type";

  MinimumFixtureRequired(this.occupancies, this._router){
    totalFacilitiesRequired = TotalFacilitiesRequired();
    occupantLoadFactor = OccupantLoadFactor.Init();
    fixtureUnit = FixtureUnit.Void();

    gen = Pfm.Init();
    gen.fixtureUnit = fixtureUnit;

    pt = PatientRoom.Init();
    pt.fixtureUnit = fixtureUnit;

    fakemap = CommonInputList.Init();
    fakemap.fixtureUnit = fixtureUnit;

    
  }

  @override
  void ngOnInit() async{

    if(!await CheckUser.IsValidUser()){
      UserInformation.previousUrl = html.window.location.href;
      _router.navigate(LoginPaths.loginPage.toUrl());
    }
    String path = html.window.location.href.replaceFirst(html.window.location.host + "/#/", "");
    print(path);
    Map queryMap = Uri.parse(path).queryParameters;
    if(queryMap != null && queryMap.containsKey(RoutePathPlumbing.idParam)){
      id = int.parse(queryMap[RoutePathPlumbing.idParam]);
      String url = UserInformation.serverhost + "/data";
      url += "?code=${UserInformation.authorizationCode}&id=${id}";
      
      http.Response response  = await http.get(url);
      if(response == null || response.body.isEmpty) return;

      Map map = await jsonDecode(response.body);
      String commandName = _trim(map["command"]);
      String dataStr = map["data"] as String;
      print(dataStr);
      dataStr = _trim(dataStr);
      if(dataStr != null && commandName != null && commandName == "minimumfixturerequirement")
        totalFacilitiesRequired = TotalFacilitiesRequired.fromJson(dataStr);
    }
    typeOfOccupancy = occupancies.getTypeOfOccupancy();
  }

  String _trim(String dataString){
    if(dataString != null && dataString.length > 2){
      dataString = dataString.trim();
      if(dataString[0] == '\'' && dataString[dataString.length - 1] == '\''){
        dataString = dataString.substring(1, dataString.length - 1);
      }if(dataString[0] == '\"' && dataString[dataString.length -1] == '\"'){
        dataString = dataString.substring(1, dataString.length - 1);
      }
    }
    return dataString;
  }

  getItem(TypeOfOccupancy item){   
    buttonText = item.type;
    chooseOccupancy = item;
    fixtureUnit = FixtureUnit(item);
    gen = Pfm(fixtureUnit);
    pt = PatientRoom(fixtureUnit);
    fakemap = CommonInputList(fixtureUnit);
    occupantLoadFactor.gen = gen;

  }

  addFixture(){
    if(fixtureUnit != null && fixtureUnit.IsAddable()){
      totalFacilitiesRequired.AddFixtureOccupancy(fixtureUnit);
      totalFacilitiesRequired.Recalculate();
    }
  }

  createJson() async{
    String jsonData = totalFacilitiesRequired.toJson();
    Map map = {
      "DATA": jsonData,
      "DATE": DateTime.now().toUtc().toString(),
      "COMMAND": "minimumfixturerequirement",
      "code" : UserInformation.authorizationCode
    };

    String tempHrefUrl = html.window.location.href;
    tempHrefUrl =  tempHrefUrl.replaceAll(html.window.location.host + "/#/", '');
    Map urlMap = Uri.parse(tempHrefUrl).queryParameters;
    if(urlMap != null && urlMap.containsKey("id")){
      map["id"] = int.tryParse(urlMap["id"]);
    }else if(id != -1){
      map["id"] = id;
    }
    http.Response response = await http.post(UserInformation.serverhost + "/data", body: jsonEncode(map));
    Map jsonResponse = jsonDecode(response.body);
    if(jsonResponse.containsKey("id")){
      Map mapToClipBoard = {
        "id": jsonResponse["id"],
        "data": jsonData
      };
      html.document.execCommand("copy");
      _copyToClipboardHack(jsonEncode(mapToClipBoard));
    }
    html.window.open('','_parent', '');
    html.window.close();
    //html.window.close();
  }

  bool _copyToClipboardHack(String text) {
    final textarea = html.TextAreaElement();
    html.document.body.append(textarea);
    textarea.style.border = '0';
    textarea.style.margin = '0';
    textarea.style.padding = '0';
    textarea.style.opacity = '0';
    textarea.style.position = 'absolute';
    textarea.readOnly = true;
    textarea.value = text;
    textarea.select();
    final result = html.document.execCommand('copy');
    textarea.remove();
    return result;
  }
}