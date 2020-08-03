class OccupantLoadFactor{
  String type;
  String description;
  double areaEntered = 0;
  int occupant_load_factor;

  OccupantLoadFactor(this.type, this.occupant_load_factor, this.description);

  int GetPersonsOutOfLoadFactor(double area){
    if(occupant_load_factor != null && area > 0){
      areaEntered = area;
      return (area/occupant_load_factor.toDouble()).ceil();
    }
    areaEntered = 0;
    return 0;
  }
}