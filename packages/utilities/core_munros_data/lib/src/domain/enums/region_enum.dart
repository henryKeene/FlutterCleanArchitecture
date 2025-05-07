enum RegionEnum {
  lomondToTay(1),
  tayToRannochMoor(2),
  strathOrchyToLochLeven(3),
  lochLinheToLochEricht(4),
  lochRannochToDrumochter(5),
  glenGarryToBraemar(6),
  glensheeToMountKeen(7),
  theCairngorms(8),
  glenRoyToTheMonadhliath(9),
  lochEilToGlenShiel(10),
  glenAffricAndKintail(11),
  glenCannichToGlenCarron(12),
  coulinAndTorridon(13),
  lochMareeToLochBroom(14),
  lochBroomToEasterRoss(15),
  coigachToCapeWrath(16),
  theIslands(17);

  const RegionEnum(this.regionId);

  final int regionId;
}
