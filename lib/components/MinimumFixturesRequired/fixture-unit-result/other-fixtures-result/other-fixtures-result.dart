

import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/fixture-and-units.dart';
import 'package:angular_components/material_radio/material_radio.dart';
import 'package:angular_components/material_radio/material_radio_group.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'other-fixtures-result-app',
  styleUrls: ['other-fixtures-result.css',
              'package:angular_components/app_layout/layout.scss.css',
              'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
              
  ],
  templateUrl: 'other-fixtures-result.html',
  directives: [
    NgModel,
    MaterialIconComponent,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    coreDirectives, 
  ]
)
class OtherFixturesResult implements AfterChanges{
  @Input() FixtureUnit fixtureUnit;
  int numOfOptions = 0;
  int i = 0;
  List<table422_1Categories> _selectedOption;
  Map<table422_1Categories, String> iconUrl = fixtureIconUrl;
  Map<table422_1Categories, String> catMap = table422_1CategoriesNames;

  List<table422_1Categories> get selectedOption => _selectedOption;
  void set selectedOption(List<table422_1Categories> option){
    if(_selectedOption == option) return;
    _selectedOption = option;
    fixtureUnit.choiceOption = fixtureUnit.otherOptions.indexOf(selectedOption);
  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null && fixtureUnit.HasOtherFixture()){
      numOfOptions = fixtureUnit.otherOptions.length;
      
    }
  }  
}