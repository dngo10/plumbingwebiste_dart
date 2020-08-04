class OccupantLoadFactor{
  String type;
  String description;
  double areaEntered = 0;
  double persons = 0;
  int occupant_load_factor;

  OccupantLoadFactor(this.type, this.occupant_load_factor, this.description);

  void GetPersonsOutOfLoadFactor(){
    if(occupant_load_factor != null && areaEntered > 0){
      persons = (areaEntered/occupant_load_factor.toDouble()).ceil().toDouble();
      return;
    }
    persons = 0;
    areaEntered = 0;
    return;
  }
}