import '../components/MinimumFixturesRequired/user-input-component/male-female-input/male-female-input.dart';

class OccupantLoadFactor{
  String type;
  String description;
  double _areaEntered = 0;
  double persons = 0;
  int occupant_load_factor;
  Pfm gen;

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

  OccupantLoadFactor(this.type, this.occupant_load_factor, this.description);

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