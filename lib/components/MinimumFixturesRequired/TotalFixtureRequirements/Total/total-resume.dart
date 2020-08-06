import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'total-resume-app',
  templateUrl: 'total-resume.html',
  styleUrls: ['total-resume.css',
              'package:angular_components/app_layout/layout.scss.css',
             ],
  directives: [coreDirectives,
               formDirectives,
               MaterialInputComponent,
               MaterialFabComponent,
               MaterialIconComponent,
               MaterialButtonComponent,
               materialInputDirectives,
               materialNumberInputDirectives,
              ]

)
class TotalResume implements AfterChanges, AfterViewChecked{
  @Input() TotalFacilitiesRequired totalFacilitiesRequired;

  Map<table422_1Categories, double> items;
  Map<table422_1Categories, String> catMap = table422_1CategoriesNames;
  Map<table422_1Categories, String> urlMap =  fixtureIconUrl;

  @override
  void ngAfterChanges() {
    // TODO: implement ngAfterViewChecked
        if(totalFacilitiesRequired != null){
      totalFacilitiesRequired.Recalculate();
      items = totalFacilitiesRequired.totalRequiredFixture;
      print("get");
    }
  }

  @override
  void ngAfterViewChecked() {

  }

  
}