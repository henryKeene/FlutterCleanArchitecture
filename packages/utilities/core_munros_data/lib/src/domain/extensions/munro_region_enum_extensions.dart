import '../enums/region_enum.dart';

extension MunroRegionEnumExtensions on RegionEnum {
  String get title {
    switch (this) {
      case RegionEnum.coigachToCapeWrath:
        return 'Coigach to Cape Wrath';
      case RegionEnum.lomondToTay:
        return 'Lomond to Tay';
      case RegionEnum.tayToRannochMoor:
        return 'Tay to Rannoch Moor';
      case RegionEnum.strathOrchyToLochLeven:
        return 'Strath Orchy to Loch Leven';
      case RegionEnum.lochLinheToLochEricht:
        return 'Loch Linhe to Loch Ericht';
      case RegionEnum.lochRannochToDrumochter:
        return 'Loch Rannoch to Drumochter';
      case RegionEnum.glenGarryToBraemar:
        return 'Glen Garry to Braemar';
      case RegionEnum.glensheeToMountKeen:
        return 'Glenshee to Mount Keen';
      case RegionEnum.theCairngorms:
        return 'The Cairngorms';
      case RegionEnum.glenRoyToTheMonadhliath:
        return 'Glen Roy to The Monadhliath';
      case RegionEnum.lochEilToGlenShiel:
        return 'Loch Eil to Glen Shiel';
      case RegionEnum.glenAffricAndKintail:
        return 'Glen Affric and Kintail';
      case RegionEnum.glenCannichToGlenCarron:
        return 'Glen Cannich to Glen Carron';
      case RegionEnum.coulinAndTorridon:
        return 'Coulin and Torridon';
      case RegionEnum.lochMareeToLochBroom:
        return 'Loch Maree to Loch Broom';
      case RegionEnum.lochBroomToEasterRoss:
        return 'Loch Broom to Easter Ross';
      case RegionEnum.theIslands:
        return 'The Islands';
    }
  }
}
