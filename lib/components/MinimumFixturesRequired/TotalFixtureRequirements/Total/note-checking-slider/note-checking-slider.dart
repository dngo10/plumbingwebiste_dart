import 'package:angular/angular.dart';
import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/total-facilities-required.dart';
import 'package:angular_components/material_slider/material_slider.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';
import 'package:angular_app/Interfaces/fixture-icons-url.dart';



@Component(
  selector: 'note-checking-slider-app',
  templateUrl: 'note-checking-slider.html',
  styleUrls: ['note-checking-slider.css',
              'package:angular_components/app_layout/layout.scss.css'
             ],
  directives: [MaterialSliderComponent,
               coreDirectives,
              ]
)
class NoteCheckingSlider{
  @Input() TotalFacilitiesRequired totalFacilitiesRequired;
  
  bool disabled= false;

  Set<String> catMap = Table422_1Categories.OutputSet;
  Map<String, String> urlMap =  fixtureIconUrl;

  String urinal = Table422_1Categories.urinals;
  String waterCloset = Table422_1Categories.waterClosets;

  NoteCheckingSlider(){
    
  }
}