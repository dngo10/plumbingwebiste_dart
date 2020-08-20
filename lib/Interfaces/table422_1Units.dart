
enum table422_1Units{
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
}

Set<table422_1Units> InputSet = {
  table422_1Units.person,
  table422_1Units.male,
  table422_1Units.female,
  table422_1Units.apartment,
  table422_1Units.floor,
  table422_1Units.floorOrcellBlock,
  table422_1Units.room,
  table422_1Units.cell,
  table422_1Units.sleepingroom,
  table422_1Units.patient,
  table422_1Units.none
};

enum table422_1Categories{ // this is also outputset
    waterClosets,
    urinals,
    lavatories,
    bathtubsOrShowers,
    drinkingFountains,
    servicesink,
    laundrytray,
    kitchensink,
    automaticclotheswasherconnection,
}

Set<table422_1Categories> OtherSet = {
    table422_1Categories.servicesink,
    table422_1Categories.laundrytray,
    table422_1Categories.kitchensink,
    table422_1Categories.automaticclotheswasherconnection,
};

Set<table422_1Categories> OutputSet = {
  table422_1Categories.waterClosets,
  table422_1Categories.automaticclotheswasherconnection,
  table422_1Categories.bathtubsOrShowers,
  table422_1Categories.drinkingFountains,
  table422_1Categories.kitchensink,
  table422_1Categories.laundrytray,
  table422_1Categories.lavatories,
  table422_1Categories.servicesink,
  table422_1Categories.urinals,
};

Map<table422_1Categories, String> table422_1CategoriesNames  = {  
  table422_1Categories.waterClosets: "WATER CLOSETS",
  table422_1Categories.urinals: "URINALS",
  table422_1Categories.lavatories: "LAVATORIES ",
  table422_1Categories.bathtubsOrShowers: "BATHTUBS OR SHOWERS",
  table422_1Categories.drinkingFountains: "DRINKING FOUNTAINS/ FACILITIES",
  table422_1Categories.servicesink: "SERVICE SINK",
  table422_1Categories.laundrytray: "LAUNDRY TRAY",
  table422_1Categories.kitchensink: "KITCHEN SINK",
  table422_1Categories.automaticclotheswasherconnection: "AUTOMATIC CLOTHES WASHER CONNECTION",
};

enum table422_1Ids{
    A1,A2,A3,A4,A5,B,E,F1,F2,I1,
    I2_1,I2_2,I2_3,I3_1,I3_2,I3_3,I4,M,
    R1,R2_1,R2_2,R2_3,R3_1,R3_2,R4,S1,S2
}



Map<table422_1Units, String> table422_1Units_Names = {
  table422_1Units.patient: "patient",
  table422_1Units.apartment: "apartment",
  table422_1Units.male: "male",
  table422_1Units.female: "female",
  table422_1Units.person: "person",
  table422_1Units.floorOrcellBlock: "cellblock/floor",
  table422_1Units.room: "room",
  table422_1Units.floor: "floor",
  table422_1Units.cell: "cell",
  table422_1Units.familydwelling: "family dwelling",
  table422_1Units.sleepingroom: "sleeping room",
};

class PairEntry{
  table422_1Categories t1;
  table422_1Units t2;

  PairEntry(this.t1, this.t2);
}

///PairEntry is: <table422_1Categories,table422_1Units> , the biggest, most important map
 Map<PairEntry, List<table422_1Ids>> typeAndAllowance = {
    PairEntry(table422_1Categories.waterClosets, table422_1Units.person): [table422_1Ids.I3_2],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.male): [
        table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
        table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
        table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_3, table422_1Ids.I3_3,
        table422_1Ids.I4,table422_1Ids.M, table422_1Ids.R2_1,table422_1Ids.R2_2,
        table422_1Ids.R3_1, table422_1Ids.R4,table422_1Ids.S1, table422_1Ids.S2
        ],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.female): [
        table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
        table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
        table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_3, table422_1Ids.I3_3,
        table422_1Ids.I4,table422_1Ids.M, table422_1Ids.R2_1,table422_1Ids.R2_2,
        table422_1Ids.R3_1, table422_1Ids.R4,table422_1Ids.S1, table422_1Ids.S2
        ],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.room): [table422_1Ids.I2_1,table422_1Ids.I2_2],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.apartment): [table422_1Ids.R2_3],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.cell): [table422_1Ids.I3_1],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.sleepingroom): [table422_1Ids.R1],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.familydwelling): [table422_1Ids.R3_2],
    PairEntry(table422_1Categories.waterClosets, table422_1Units.patient): [table422_1Ids.I2_1],

    PairEntry(table422_1Categories.urinals, table422_1Units.male): [
        table422_1Ids.A1,table422_1Ids.A2,table422_1Ids.A3,table422_1Ids.A4,
        table422_1Ids.A5,table422_1Ids.B,table422_1Ids.E,table422_1Ids.I1,
        table422_1Ids.M,table422_1Ids.R2_1
    ],

    PairEntry(table422_1Categories.lavatories, table422_1Units.person): [table422_1Ids.I3_2],
    PairEntry(table422_1Categories.lavatories, table422_1Units.male): [
        table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
        table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
        table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_3, table422_1Ids.I3_3,
        table422_1Ids.I4,table422_1Ids.M, table422_1Ids.R2_1,table422_1Ids.R2_2,
        table422_1Ids.R3_1, table422_1Ids.R4,table422_1Ids.S1, table422_1Ids.S2
        ],
    PairEntry(table422_1Categories.lavatories, table422_1Units.female): [
        table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
        table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
        table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_3, table422_1Ids.I3_3,
        table422_1Ids.I4,table422_1Ids.M, table422_1Ids.R2_1,table422_1Ids.R2_2,
        table422_1Ids.R3_1, table422_1Ids.R4,table422_1Ids.S1, table422_1Ids.S2
    ],
    PairEntry(table422_1Categories.lavatories, table422_1Units.room):[table422_1Ids.I2_1,table422_1Ids.I2_2],
    PairEntry(table422_1Categories.lavatories, table422_1Units.apartment): [table422_1Ids.R2_3],
    PairEntry(table422_1Categories.lavatories, table422_1Units.cell): [table422_1Ids.I3_1],
    PairEntry(table422_1Categories.lavatories, table422_1Units.person): [table422_1Ids.I3_2],
    PairEntry(table422_1Categories.lavatories, table422_1Units.sleepingroom): [table422_1Ids.R1],
    PairEntry(table422_1Categories.lavatories, table422_1Units.familydwelling): [table422_1Ids.R3_2],
    PairEntry(table422_1Categories.lavatories, table422_1Units.patient): [table422_1Ids.I2_1],

    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.person): [
        table422_1Ids.I1, table422_1Ids.I3_1, table422_1Ids.I3_2,
        table422_1Ids.R2_1, table422_1Ids.R3_1, table422_1Ids.R4,
        table422_1Ids.F1, table422_1Ids.F2,
    ],
    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.room): [table422_1Ids.I2_1],
    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.patient): [table422_1Ids.I2_1],
    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.sleepingroom): [table422_1Ids.R1],
    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.apartment): [table422_1Ids.R2_3],
    PairEntry(table422_1Categories.bathtubsOrShowers, table422_1Units.familydwelling) : [table422_1Ids.R3_2],

    PairEntry(table422_1Categories.drinkingFountains, table422_1Units.person): [
        table422_1Ids.A1,table422_1Ids.A2, table422_1Ids.A3,table422_1Ids.A4,
        table422_1Ids.A5,table422_1Ids.B, table422_1Ids.E,table422_1Ids.F1,
        table422_1Ids.F2,table422_1Ids.I2_1, table422_1Ids.I3_3,table422_1Ids.I4,
        table422_1Ids.M,table422_1Ids.R2_1, table422_1Ids.R3_1,table422_1Ids.R4,
        table422_1Ids.S1,table422_1Ids.S2
    ],
    PairEntry(table422_1Categories.drinkingFountains, table422_1Units.floorOrcellBlock): [table422_1Ids.I3_1],
    PairEntry(table422_1Categories.drinkingFountains, table422_1Units.floor): [table422_1Ids.I3_2],
    PairEntry(table422_1Categories.drinkingFountains, table422_1Units.room): [table422_1Ids.I2_2],

    PairEntry(table422_1Categories.servicesink, table422_1Units.none): [
      table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
      table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
      table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_1, table422_1Ids.I3_2,
      table422_1Ids.I4, table422_1Ids.M, table422_1Ids.R1, table422_1Ids.R2_1,
      table422_1Ids.R2_2, table422_1Ids.R3_1, table422_1Ids.R4, table422_1Ids.S1,
      table422_1Ids.S2
    ],

    PairEntry(table422_1Categories.laundrytray, table422_1Units.none):[
      table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
      table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
      table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_1, table422_1Ids.I3_2,
      table422_1Ids.I4, table422_1Ids.M, table422_1Ids.R1, table422_1Ids.R2_1,
      table422_1Ids.R2_2, table422_1Ids.R3_1, table422_1Ids.R4, table422_1Ids.S1,
      table422_1Ids.S2
    ],

    PairEntry(table422_1Categories.laundrytray, table422_1Units.apartment):[table422_1Ids.R2_3],

    PairEntry(table422_1Categories.kitchensink, table422_1Units.apartment): [table422_1Ids.R2_3],

    PairEntry(table422_1Categories.kitchensink, table422_1Units.familydwelling):[table422_1Ids.R3_2],

    PairEntry(table422_1Categories.automaticclotheswasherconnection, table422_1Units.apartment): [table422_1Ids.R2_3],
    
    PairEntry(table422_1Categories.automaticclotheswasherconnection, table422_1Units.familydwelling):[table422_1Ids.R3_2],
};

// Service Sink or Laundry Tray
List<table422_1Categories> _ss = [table422_1Categories.servicesink];
List<table422_1Categories> _lt = [table422_1Categories.laundrytray];

// Combo 1 For R2-3
List<table422_1Categories> _cb1 = [table422_1Categories.kitchensink,
                                  table422_1Categories.laundrytray,
                                 ];

List<table422_1Categories> _cb2 = [table422_1Categories.kitchensink,
                                  table422_1Categories.automaticclotheswasherconnection,
                                 ];


// -- LaundryTray is used PER UNIT OR PER 12 UNITs (Maybe big ones)
// -- Basically there is 2 ways of calulating it.
// -- Be very carefull OR YOU WILL BREAK THE PLUMBING CODE
List<table422_1Categories> _cb3 = [table422_1Categories.kitchensink,
                                  table422_1Categories.laundrytray,
                                 ];

List<table422_1Categories> _cb4 = [table422_1Categories.kitchensink,
                                  table422_1Categories.automaticclotheswasherconnection,
                                 ];

// Combo 2 For R3-2
List<table422_1Categories> _cb5 = [table422_1Categories.kitchensink,
                                  table422_1Categories.automaticclotheswasherconnection
                                 ];

List<List<table422_1Categories>> _commonOp1 = [_ss, _lt];
List<List<table422_1Categories>> _r2_3Op2 =[_cb1, _cb2, _cb3, _cb4];
List<List<table422_1Categories>> _r3_2Op2 = [_cb5];

enum comboOthers{
  common,
  r2_3,
  r3_2,
}

Map<comboOthers, List<List<table422_1Categories>>> otherCheckSet = {
  comboOthers.common: _commonOp1,
  comboOthers.r2_3: _r2_3Op2,
  comboOthers.r3_2: _r3_2Op2
};

//Map<table422_1Ids, List<List<table422_1Categories>>> otherFixtureOptions = {
//  table422_1Ids.A1 : _commonOp1,
//  table422_1Ids.A2 : _commonOp1,
//  table422_1Ids.A3 : _commonOp1,
//  table422_1Ids.A4 : _commonOp1,
//  table422_1Ids.A5 : _commonOp1,
//  table422_1Ids.B : _commonOp1,
//  table422_1Ids.E : _commonOp1,
//  table422_1Ids.F1 : _commonOp1,
//  table422_1Ids.F2 : _commonOp1,
//  table422_1Ids.I1 : _commonOp1,
//  table422_1Ids.I2_1 : _commonOp1,
//  table422_1Ids.I3_2 : _commonOp1,
//  table422_1Ids.I4 : _commonOp1,
//  table422_1Ids.M : _commonOp1,
//  table422_1Ids.R1 : _commonOp1,
//  table422_1Ids.R2_1 : _commonOp1,
//  table422_1Ids.R2_2 : _commonOp1,
//  table422_1Ids.R3_1 : _commonOp1,
//  table422_1Ids.R4 : _commonOp1,
//  table422_1Ids.S1 : _commonOp1,
//  table422_1Ids.S2 : _commonOp1,
//
//  table422_1Ids.R2_3: _r2_3Op2,
//  table422_1Ids.R3_2: _r3_2Op2
//};



