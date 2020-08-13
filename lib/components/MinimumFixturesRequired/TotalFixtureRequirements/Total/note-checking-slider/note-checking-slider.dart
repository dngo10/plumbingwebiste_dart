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

  Map<table422_1Categories, String> catMap = table422_1CategoriesNames;
  Map<table422_1Categories, String> urlMap =  fixtureIconUrl;

  table422_1Categories urinal = table422_1Categories.urinals;
  table422_1Categories waterCloset = table422_1Categories.waterClosets;

  NoteCheckingSlider(){
    
  }
}