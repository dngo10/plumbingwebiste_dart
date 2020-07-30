import 'package:angular_app/Interfaces/occupant-load-factor.dart';

class OccupantLoadFactorService {
  Map<String, OccupantLoadFactor> regexMap;

  List<OccupantLoadFactor> occupantLoadFactor = [
/*0*/ OccupantLoadFactor("A-1", 15,
        "Auditoriums, convention halls, dance floors, lodge rooms, stadiums, and casinos (where no fixed seating is provided) (Where fixed seating is provided use one-half the number of fixed seating.)"),
/*1*/ OccupantLoadFactor("A-2", 30,
        "Conference rooms, dining rooms, drinking establishments, exhibit rooms, gymnasiums, lounges, stages, and similar uses, including restaurants classified as Group B occupancies"),
/*2*/ OccupantLoadFactor("A-3", 30,
        "Worship places; principal assembly area, educational and activity unit (where no fixed seating is provided)(Where fixed seating is provided use one-half the number of fixed seating.)"),

/*3*/ OccupantLoadFactor(
        "B", 200, "Office or public buildings (area accessible to the public)"),
/*4*/ OccupantLoadFactor(
        "E", 50, "Schools for day care, elementary, secondary"),
/*5*/ OccupantLoadFactor("Educational Facilities Other thancupant_load_factor",
        50, "Colleges, universities, adult centers, etc."),

/*6*/ OccupantLoadFactor(
        "F", 2000, "Workshops, foundries and similar establishments"),
/*5*/ OccupantLoadFactor(
        "H", 2000, "Hazardous materials fabrication and storage"),
/*8*/ OccupantLoadFactor(
        "I", 200, "Hospital general use area, health care facilities"),
/*9*/ OccupantLoadFactor("M", 200, "Retail or wholesale stores"),
/*10*/ OccupantLoadFactor("R", 200, "Congregate residence, Group R-1"),
/*11*/ OccupantLoadFactor("S", 5000, "Warehouse"),
  ];

  OccupantLoadFactorService() {
    this.regexMap = Map<String, OccupantLoadFactor>();

    RegExp patternA1 = RegExp(r"^A-1$");
    RegExp patternA2 = RegExp(r"^A-2$");
    RegExp patternA3 = RegExp(r"^A-3$");
    RegExp patternB = RegExp(r"^B$");
    RegExp patternE = RegExp(r"^E$");
    RegExp patternM = RegExp(r"^M$");
    RegExp patternF = RegExp(r"^F-[1|2]$");
    RegExp patternI = RegExp(r"^I-[1|2|3|4]$");
    RegExp patternR = RegExp(r"^R-[1|2|3|4]$");
    RegExp patternS = RegExp(r"^S-[1|2]$");

    regexMap[patternA1.pattern] = occupantLoadFactor[0];
    regexMap[patternA2.pattern] = occupantLoadFactor[1];
    regexMap[patternA3.pattern] = occupantLoadFactor[2];
    regexMap[patternB.pattern] =  occupantLoadFactor[3];
    regexMap[patternE.pattern] =  occupantLoadFactor[4];
    regexMap[patternM.pattern] =  occupantLoadFactor[9];
    regexMap[patternF.pattern] =  occupantLoadFactor[6];
    regexMap[patternI.pattern] =  occupantLoadFactor[8];
    regexMap[patternR.pattern] =  occupantLoadFactor[10];
    regexMap[patternS.pattern] =  occupantLoadFactor[11];
  }

  List<OccupantLoadFactor> getOccupantLoadFactor() {
    return this.occupantLoadFactor;
  }

  OccupantLoadFactor getLoadFactor(String type) {
    OccupantLoadFactor ans;
    this.regexMap.forEach((key, value) {
      RegExp rg = RegExp(key);
      if (rg.hasMatch(type)) {
        ans = value;
      }
    });

    return ans;
  }
}
