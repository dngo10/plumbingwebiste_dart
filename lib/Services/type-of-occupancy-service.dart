import 'package:angular_app/Interfaces/occupancy-category.dart';
import 'package:angular_app/Interfaces/table422_1Units.dart';

class TypeOfOccupancyService{
  List<TypeOfOccupancy> typeOfOccupancy = [
      TypeOfOccupancy(Table422_1Ids.A1,  'A-1', null, "Assembly occupancy (fixed or permanent seating)- theaters, concert halls, and auditoriums"),
      TypeOfOccupancy(Table422_1Ids.A2,  'A-2', null, "Assembly occupancy restaurants, pubs, lounges, night clubs and banquet halls"),
      TypeOfOccupancy(Table422_1Ids.A3,  'A-3', null, "Assembly occupancy (typical without fixed or permanent seating)-arcades, places of worship, museums, libraries, lecture halls, gymnasiums (without spectator seating), indoor pools (without spectator seating)"),
      TypeOfOccupancy(Table422_1Ids.A4,  'A-4', null, "Assembly occupancy(indoor activities or sporting events with spectator seating)- swimming pools, skating rinks, arenas and gymnasiums"),
      TypeOfOccupancy(Table422_1Ids.A5,  'A-5', null, "Assembly occupancy (outdoor activities or sporting events)- amusement parks, grandstands and stadiums  "),
      
      TypeOfOccupancy(Table422_1Ids.B,  'B',   null,  "Business occupancy (office, professional or service type transactions)- banks, vet clinics, hospitals, car wash, banks, beauty salons, ambulatory health care facilities, laundries and dry cleaning, educational institutions (above high school), or training facilities not located within school, post offices and printing shops"),
      TypeOfOccupancy(Table422_1Ids.E,  'E',   null, "Educational occupancy-private or public schools"),
      TypeOfOccupancy(Table422_1Ids.F1, 'F-1', null, "Factory or Industrial occupancy-fabricating or assembly work"),
      TypeOfOccupancy(Table422_1Ids.F2, 'F-2', null, "Factory or Industrial occupancy-fabricating or assembly work"),

      TypeOfOccupancy(Table422_1Ids.I1, 'I-1', null, "Institutional occupancy(houses more than 16 persons on a 24-hour basis)- substance abuse centers, assisted living, group homes, or residential facilities"),
      
      TypeOfOccupancy(Table422_1Ids.I2_1, 'I-2', "Hospitals and nursing homes-individual rooms and ward room", "Institutional occupancy-medical, psychiatric, surgical or nursing homes"),
      TypeOfOccupancy(Table422_1Ids.I2_2, 'I-2', "Hospital Waiting or Visitor Rooms", "Institutional occupancy-medical, psychiatric, surgical or nursing homes"),
      TypeOfOccupancy(Table422_1Ids.I2_3, 'I-2', "Employee Use", "Institutional occupancy-medical, psychiatric, surgical or nursing homes"),
      
      TypeOfOccupancy(Table422_1Ids.I3_1, 'I-3', "Prisons", "Institutional occupancy(houses more than 5 people)"),
      TypeOfOccupancy(Table422_1Ids.I3_2, 'I-3', "Correctional facilities or juvenile center", "Institutional occupancy(houses more than 5 people)"),
      TypeOfOccupancy(Table422_1Ids.I3_3, 'I-3', "Employee Use", "Institutional occupancy(houses more than 5 people)"),
      
      TypeOfOccupancy(Table422_1Ids.I4, 'I-4', null, "Institutional occupancy (any age that receives care for less than 24 hours)"),
      
      TypeOfOccupancy(Table422_1Ids.M, 'M', null, "Mercantile occupancy (the sale of merchandise and accessible to the public)"),
      
      TypeOfOccupancy(Table422_1Ids.R1, 'R-1', null, "Residential occupancy (minimal stay)- hotels, motels, bed and breakfast homes"),

      TypeOfOccupancy(Table422_1Ids.R2_1, 'R-2', "Dormitories", "Residential occupancy (long-term or permanent)"),
      TypeOfOccupancy(Table422_1Ids.R2_2, 'R-2', "Employee Use", "Residential occupancy (long-term or permanent)"),
      TypeOfOccupancy(Table422_1Ids.R2_3, 'R-2', "Apartmenthouse/unit", "Residential occupancy (long-term or permanent)"),

      TypeOfOccupancy(Table422_1Ids.R3_1, 'R-3', "Residential occupancy (long-term or permanent in nature) for more than 5 but does not exceed 16 occupants)", "Residential occupancy"),
      TypeOfOccupancy(Table422_1Ids.R3_2, 'R-3', "Residential occupancy (one and two family dwellings)", "Residential occupancy"),
      
      TypeOfOccupancy(Table422_1Ids.R4, 'R-4', null, "Residential occupancy (residential care or assisted living)"),
      
      TypeOfOccupancy(Table422_1Ids.S1, 'S-1', null, "Storage occupancy-storage of goods, warehouse, aircraft hanger, food products, appliances"),
      TypeOfOccupancy(Table422_1Ids.S2, 'S-2', null, "Storage occupancy-storage of goods, warehouse, aircraft hanger, food products, appliances"),
  ];

  TypeOfOccupancyService(){}

  List<TypeOfOccupancy> getTypeOfOccupancy(){
    return this.typeOfOccupancy;
  }

}