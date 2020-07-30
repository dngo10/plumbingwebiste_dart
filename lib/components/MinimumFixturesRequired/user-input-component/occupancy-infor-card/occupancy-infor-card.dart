import 'package:angular/angular.dart';
import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'occupancy-infor-card',
  templateUrl: 'occupancy-infor-card.html',
  styleUrls: ['occupancy-infor-card.css',
              'package:angular_components/app_layout/layout.scss.css',
              'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
  ],
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    coreDirectives,
  ],
)
class OccupancyInforCard implements AfterChanges, OnInit{
  @Input() TypeOfOccupancy occupancy;

  String type;
  String sub_type;
  String description;

  @override
  void ngAfterChanges() {
    // TODO: implement ngAfterChanges
  }

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }
}
