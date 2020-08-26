import 'package:angular_app/LogicCalculations/MinimumPlumbingFacilities/FixtureModel/Pfm.dart';

class OccupantLoadFactor{
  String type;
  String description;
  double _areaEntered = 0;
  double persons = 0;
  int occupant_load_factor;
  // gen MUST BE ASSIGNED LATER, NOT IN CONSTRUCTOR
  Pfm gen;

  bool isNull(){
    return occupant_load_factor == null || occupant_load_factor == 0;
  }

  double get areaEntered{
    return _areaEntered;
  }

  void set areaEntered(double value){
    if(value <= 0){
      _areaEntered = 0;
    } else{
      _areaEntered = value;
      GetPersonsOutOfLoadFactor();
      if(gen != null){
        gen.person = persons;
      }
    }
  }

  void reset(){
    areaEntered = 0;
  }

  void merge(OccupantLoadFactor occupantLoadFactor){
    if(occupantLoadFactor == null) return;
    this.type = occupantLoadFactor.type;
    this.description = occupantLoadFactor.description;
    this. areaEntered = occupantLoadFactor.areaEntered;
    this.occupant_load_factor = occupantLoadFactor.occupant_load_factor;
  }

  OccupantLoadFactor(this.type, this.occupant_load_factor, this.description, this.gen);

  OccupantLoadFactor.Init();

  void GetPersonsOutOfLoadFactor(){
    //Fixed, make sure persons always % 2 == 0
    if(occupant_load_factor != null && _areaEntered > 0){
      int tempPerson = (_areaEntered/occupant_load_factor.toDouble()).ceil();
      if(tempPerson % 2 == 1){
        tempPerson += 1;
      }

      persons = tempPerson.toDouble();
      return;
    }
    persons = 0;
    _areaEntered = 0;
    return;
  }
}