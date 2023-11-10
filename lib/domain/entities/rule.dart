import 'package:pedra_papel_game/domain/enums/move_type.dart';

abstract class Rule {
  late final Map<MoveType, List<MoveType>> mapWinning;
  bool isWin(MoveType playerMove, MoveType computerMove);
  void setWinningMap(Map<MoveType, List<MoveType>> map);
}