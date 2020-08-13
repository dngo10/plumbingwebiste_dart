
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
    servicesink,
    laundrytray,
    kitchensink,
    automaticclotheswasherconnection,

}

enum table422_1Categories{
    waterClosets,
    urinals,
    lavatories,
    bathtubsOrShowers,
    drinkingFountains,
    other
}

Map<table422_1Categories, String> table422_1CategoriesNames  = {  
  table422_1Categories.waterClosets: "WATER CLOSETS",
  table422_1Categories.urinals: "URINALS",
  table422_1Categories.lavatories: "LAVATORIES ",
  table422_1Categories.bathtubsOrShowers: "BATHTUBS OR SHOWERS",
  table422_1Categories.drinkingFountains: "DRINKING FOUNTAINS/ FACILITIES",
  table422_1Categories.other: "OTHER",
};

Set<table422_1Categories> table422_1CategoriesSet = {
  table422_1Categories.drinkingFountains,
  table422_1Categories.bathtubsOrShowers,
  table422_1Categories.lavatories,
  table422_1Categories.other,
  table422_1Categories.urinals,
  table422_1Categories.waterClosets,
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
  table422_1Units.kitchensink: "kitchen sink",
  table422_1Units.laundrytray: "laundry tray",
  table422_1Units.automaticclotheswasherconnection: "automatic clothes washer connection",
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

    PairEntry(table422_1Categories.other, table422_1Units.servicesink): [
      table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
      table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
      table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_1, table422_1Ids.I3_2,
      table422_1Ids.I4, table422_1Ids.M, table422_1Ids.R1, table422_1Ids.R2_1,
      table422_1Ids.R2_2, table422_1Ids.R3_1, table422_1Ids.R4, table422_1Ids.S1,
      table422_1Ids.S2
    ],

    //it has R2_3 compared to servicesink
    PairEntry(table422_1Categories.other, table422_1Units.laundrytray):[
      table422_1Ids.A1, table422_1Ids.A2, table422_1Ids.A3, table422_1Ids.A4,
      table422_1Ids.A5, table422_1Ids.B, table422_1Ids.E, table422_1Ids.F1,
      table422_1Ids.F2, table422_1Ids.I1, table422_1Ids.I2_1, table422_1Ids.I3_2,
      table422_1Ids.I4, table422_1Ids.M, table422_1Ids.R1, table422_1Ids.R2_1,
      table422_1Ids.R2_2, table422_1Ids.R2_3, table422_1Ids.R3_1, table422_1Ids.R4, 
      table422_1Ids.S1, table422_1Ids.S2
    ],

    PairEntry(table422_1Categories.other, table422_1Units.automaticclotheswasherconnection): [
      table422_1Ids.R2_3, table422_1Ids.R3_2
    ],

    PairEntry(table422_1Categories.other, table422_1Units.kitchensink):[
      table422_1Ids.R2_3, table422_1Ids.R3_2,
    ]
};



