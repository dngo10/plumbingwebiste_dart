import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/fixture-and-units.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'fixture-unit-result-app',
  templateUrl: 'fixture-unit-result.html',
  styleUrls: ['fixture-unit-result.css',
              'package:angular_components/app_layout/layout.scss.css',
              'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
              
  ],
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    coreDirectives,
    formDirectives,
  ],
  pipes: [commonPipes]
)
class FixtureUnitResult implements AfterChanges, OnInit, AfterContentChecked {
  @Input() FixtureUnit fixtureUnit;
  Map<table422_1Categories, String> catMap;
  Map<table422_1Categories, String> iconUrl;

  @override
  void ngOnInit() {
    iconUrl = fixtureIconUrl;
  }
  
  FixtureUnitResult(){

  }

  @override
  void ngAfterChanges() {
    if(fixtureUnit != null){
      catMap = table422_1CategoriesNames;
      fixtureUnit.Recalculate();
    }
  }

  @override
  void ngAfterContentChecked() {
    if(fixtureUnit != null){
      fixtureUnit.Recalculate();
    }
  }
}