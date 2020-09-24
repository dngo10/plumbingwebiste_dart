import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_app/components/MinimumFixturesRequired/TotalFixtureRequirements/Total/note-checking-slider/note-checking-slider.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'total-resume-app',
  templateUrl: 'total-resume.html',
  styleUrls: ['total-resume.css',
              'package:angular_components/app_layout/layout.scss.css',
             ],
  directives: [coreDirectives,
               formDirectives,
               NoteCheckingSlider,
              ]

)
class TotalResume implements AfterChanges, AfterViewChecked{
  @Input() TotalFacilitiesRequired totalFacilitiesRequired;

  TotMaFe uMale = TotMaFe.totalMaleUrinals;
  TotMaFe cMale = TotMaFe.totalMaleCloset;
  TotMaFe cFemale = TotMaFe.totalFemaleCloset;

  Map<String, double> items;
  Set<String> catSet = Table422_1Categories.OutputSet;
  Map<String, String> urlMap =  fixtureIconUrl;

  @override
  void ngAfterChanges() {
      if(totalFacilitiesRequired != null){
        totalFacilitiesRequired.Recalculate();
        items = totalFacilitiesRequired.totalRequiredFixture; 
        
    }
  }

  @override
  void ngAfterViewChecked() {

  }

  
}