import 'package:pedra_papel_game/domain/entities/rule.dart';
import 'package:pedra_papel_game/domain/enums/move_type.dart';

mixin GameRulesMixin implements Rule {
  @override
  late final Map<MoveType, List<MoveType>> mapWinning;

  @override
  void setWinningMap(Map<MoveType, List<MoveType>> map) {
    mapWinning = map;
  }

  @override
  bool isWin(MoveType move1, MoveType move2) {
    if (mapWinning[move1] == null && mapWinning[move1]!.isEmpty) {
      return false;
    }
    return mapWinning[move1]!.contains(move2) ? true : false;
  }
}
