
import 'dart:convert';

/// THIS IS FOR THING ABOVE;
class Table422_1Units{
    static const String person = "person";
    static const String male = "male";
    static const String female = "female";
    static const String apartment = "apartment";
    static const String floorOrcellBlock = "cellblock/floor";
    static const String floor = "floor";
    static const String room = "room";
    static const String familydwelling = "familydwelling";
    static const String cell = "cell";
    static const String sleepingroom = "sleepingroom";
    static const String patient = "patient";
    static const String none = "none";

    static const Set<String> InputSet = {
    person,
    male,
    female,
    apartment,
    floorOrcellBlock,
    floor,
    room,
    familydwelling,
    cell,
    sleepingroom,
    patient,
    none // No unit specified.
    };
}

class Table422_1Categories{
  static const String waterClosets = "WATER CLOSETS";
  static const String urinals = "URINALS";
  static const String lavatories = "LAVATORIES";
  static const String bathtubsOrShowers = "BATHTUBS OR SHOWERS";
  static const String drinkingFountains = "DRINKING FOUNTAINS/ FACILITIES";
  static const String servicesink = "SERVICE SINK";
  static const String laundrytray = "LAUNDRY TRAY";
  static const String kitchensink = "KITCHEN SINK";
  static const String automaticclotheswasherconnection = "AUTOMATIC CLOTHES WASHER CONNECTION";
  static const String big_landrytray = "LAUNDRY ROOM";
  static const String big_automaticclotheswasherconnection  = "PUBLIC AUTOMATIC LAUNDRY";

  static const Set<String> OtherSet = {
    servicesink,
    laundrytray,
    kitchensink,
    automaticclotheswasherconnection,
    big_landrytray,
    big_automaticclotheswasherconnection,
  };

  static const Set<String> OutputSet = {
    waterClosets,
    urinals,
    lavatories,
    bathtubsOrShowers,
    drinkingFountains,
    servicesink,
    laundrytray,
    kitchensink,
    automaticclotheswasherconnection,
    big_landrytray,
    big_automaticclotheswasherconnection,
  };
}

class Table422_1Ids{
    static const String A1 = "A1",A2 = "A2",A3 = "A3",A4 = "A4",A5 = "A5",B = "B",E = "E",F1 = "F1",F2 = "F2",I1 = "I1",
    I2_1 = "I2_1",I2_2 = "I2_2",I2_3 = "I2_3",I3_1 = "I3_1",I3_2 = "I3_2",I3_3 = "I3_3",I4 = "I4",M = "M",
    R1 = "R1",R2_1 = "R2_1",R2_2 = "R2_2",R2_3 = "R2_3",R3_1 = "R3_1",R3_2 = "R3_2",R4 = "R4",S1 = "S1",S2 = "S2";
}

class PairEntry{
  String t1;
  String t2;

  PairEntry(this.t1, this.t2);

  @override
  String toString(){
    Map map = {
      "t1": t1,
      "t2": t2,
    };
    return json.encode(map);
  }
}

///PairEntry is: <table422_1Categories,table422_1Units> , the biggest, most important map
 Map<PairEntry, List<String>> typeAndAllowance = {
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.person): [Table422_1Ids.I3_2],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.male): [
        Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
        Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
        Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_3, Table422_1Ids.I3_3,
        Table422_1Ids.I4,Table422_1Ids.M, Table422_1Ids.R2_1,Table422_1Ids.R2_2,
        Table422_1Ids.R3_1, Table422_1Ids.R4,Table422_1Ids.S1, Table422_1Ids.S2
        ],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.female): [
        Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
        Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
        Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_3, Table422_1Ids.I3_3,
        Table422_1Ids.I4,Table422_1Ids.M, Table422_1Ids.R2_1,Table422_1Ids.R2_2,
        Table422_1Ids.R3_1, Table422_1Ids.R4,Table422_1Ids.S1, Table422_1Ids.S2
        ],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.room): [Table422_1Ids.I2_1,Table422_1Ids.I2_2],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.apartment): [Table422_1Ids.R2_3],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.cell): [Table422_1Ids.I3_1],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.sleepingroom): [Table422_1Ids.R1],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.familydwelling): [Table422_1Ids.R3_2],
    PairEntry(Table422_1Categories.waterClosets, Table422_1Units.patient): [Table422_1Ids.I2_1],

    PairEntry(Table422_1Categories.urinals, Table422_1Units.male): [
        Table422_1Ids.A1,Table422_1Ids.A2,Table422_1Ids.A3,Table422_1Ids.A4,
        Table422_1Ids.A5,Table422_1Ids.B,Table422_1Ids.E,Table422_1Ids.I1,
        Table422_1Ids.M,Table422_1Ids.R2_1
    ],

    PairEntry(Table422_1Categories.lavatories, Table422_1Units.person): [Table422_1Ids.I3_2],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.male): [
        Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
        Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
        Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_3, Table422_1Ids.I3_3,
        Table422_1Ids.I4,Table422_1Ids.M, Table422_1Ids.R2_1,Table422_1Ids.R2_2,
        Table422_1Ids.R3_1, Table422_1Ids.R4,Table422_1Ids.S1, Table422_1Ids.S2
        ],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.female): [
        Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
        Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
        Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_3, Table422_1Ids.I3_3,
        Table422_1Ids.I4,Table422_1Ids.M, Table422_1Ids.R2_1,Table422_1Ids.R2_2,
        Table422_1Ids.R3_1, Table422_1Ids.R4,Table422_1Ids.S1, Table422_1Ids.S2
    ],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.room):[Table422_1Ids.I2_1,Table422_1Ids.I2_2],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.apartment): [Table422_1Ids.R2_3],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.cell): [Table422_1Ids.I3_1],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.person): [Table422_1Ids.I3_2],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.sleepingroom): [Table422_1Ids.R1],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.familydwelling): [Table422_1Ids.R3_2],
    PairEntry(Table422_1Categories.lavatories, Table422_1Units.patient): [Table422_1Ids.I2_1],

    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.person): [
        Table422_1Ids.I1, Table422_1Ids.I3_1, Table422_1Ids.I3_2,
        Table422_1Ids.R2_1, Table422_1Ids.R3_1, Table422_1Ids.R4,
        Table422_1Ids.F1, Table422_1Ids.F2,
    ],
    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.room): [Table422_1Ids.I2_1],
    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.patient): [Table422_1Ids.I2_1],
    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.sleepingroom): [Table422_1Ids.R1],
    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.apartment): [Table422_1Ids.R2_3],
    PairEntry(Table422_1Categories.bathtubsOrShowers, Table422_1Units.familydwelling) : [Table422_1Ids.R3_2],

    PairEntry(Table422_1Categories.drinkingFountains, Table422_1Units.person): [
        Table422_1Ids.A1,Table422_1Ids.A2, Table422_1Ids.A3,Table422_1Ids.A4,
        Table422_1Ids.A5,Table422_1Ids.B, Table422_1Ids.E,Table422_1Ids.F1,
        Table422_1Ids.F2,Table422_1Ids.I2_1, Table422_1Ids.I3_3,Table422_1Ids.I4,
        Table422_1Ids.M,Table422_1Ids.R2_1, Table422_1Ids.R3_1,Table422_1Ids.R4,
        Table422_1Ids.S1,Table422_1Ids.S2
    ],
    PairEntry(Table422_1Categories.drinkingFountains, Table422_1Units.floorOrcellBlock): [Table422_1Ids.I3_1],
    PairEntry(Table422_1Categories.drinkingFountains, Table422_1Units.floor): [Table422_1Ids.I3_2],
    PairEntry(Table422_1Categories.drinkingFountains, Table422_1Units.room): [Table422_1Ids.I2_2],

    PairEntry(Table422_1Categories.servicesink, Table422_1Units.none): [
      Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
      Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
      Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_1, Table422_1Ids.I3_2,
      Table422_1Ids.I4, Table422_1Ids.M, Table422_1Ids.R1, Table422_1Ids.R2_1,
      Table422_1Ids.R2_2, Table422_1Ids.R3_1, Table422_1Ids.R4, Table422_1Ids.S1,
      Table422_1Ids.S2
    ],

    PairEntry(Table422_1Categories.laundrytray, Table422_1Units.none):[
      Table422_1Ids.A1, Table422_1Ids.A2, Table422_1Ids.A3, Table422_1Ids.A4,
      Table422_1Ids.A5, Table422_1Ids.B, Table422_1Ids.E, Table422_1Ids.F1,
      Table422_1Ids.F2, Table422_1Ids.I1, Table422_1Ids.I2_1, Table422_1Ids.I3_2,
      Table422_1Ids.I4, Table422_1Ids.M, Table422_1Ids.R1, Table422_1Ids.R2_1,
      Table422_1Ids.R2_2, Table422_1Ids.R3_1, Table422_1Ids.R4, Table422_1Ids.S1,
      Table422_1Ids.S2
    ],

    PairEntry(Table422_1Categories.laundrytray, Table422_1Units.apartment):[Table422_1Ids.R2_3],

    PairEntry(Table422_1Categories.kitchensink, Table422_1Units.apartment): [Table422_1Ids.R2_3],

    PairEntry(Table422_1Categories.kitchensink, Table422_1Units.familydwelling):[Table422_1Ids.R3_2],

    PairEntry(Table422_1Categories.automaticclotheswasherconnection, Table422_1Units.apartment): [Table422_1Ids.R2_3],
    
    PairEntry(Table422_1Categories.automaticclotheswasherconnection, Table422_1Units.familydwelling):[Table422_1Ids.R3_2],

    PairEntry(Table422_1Categories.big_landrytray, Table422_1Units.apartment): [Table422_1Ids.R2_3],

    PairEntry(Table422_1Categories.big_automaticclotheswasherconnection, Table422_1Units.apartment): [Table422_1Ids.R2_3],
};


// Service Sink or Laundry Tray
List<String> _ss = [Table422_1Categories.servicesink];
List<String> _lt = [Table422_1Categories.laundrytray];

// Combo 1 For R2-3
List<String> _cb1 = [Table422_1Categories.kitchensink,
                                  Table422_1Categories.laundrytray,
                                 ];

List<String> _cb2 = [Table422_1Categories.kitchensink,
                                  Table422_1Categories.automaticclotheswasherconnection,
                                 ];

// -- LaundryTray is used PER UNIT OR PER 12 UNITs (Maybe big ones)
// -- Basically there is 2 ways of calulating it.
// -- Be very carefull OR YOU WILL BREAK THE PLUMBING CODE
List<String> _cb3 = [Table422_1Categories.kitchensink,
                                  Table422_1Categories.big_landrytray,
                                 ];

List<String> _cb4 = [Table422_1Categories.kitchensink,
                                  Table422_1Categories.big_automaticclotheswasherconnection,
                                 ];

// Combo 2 For R3-2
List<String> _cb5 = [Table422_1Categories.kitchensink,
                                  Table422_1Categories.automaticclotheswasherconnection
                                 ];

List<List<String>> _commonOp1 = [_ss, _lt];
List<List<String>> _r2_3Op2 =[_cb1, _cb2, _cb3, _cb4];
List<List<String>> _r3_2Op2 = [_cb5];

class ComboOthers{
  static const String common = "common";
  static const String r2_3 = "r2_3";
  static const String r3_2 = "r3_2";
  static const String none = "none";
}

Map<String, List<List<String>>> otherCheckSet = {
  ComboOthers.common: _commonOp1,
  ComboOthers.r2_3: _r2_3Op2,
  ComboOthers.r3_2: _r3_2Op2
};



