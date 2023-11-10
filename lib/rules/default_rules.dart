import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/domain/mixins/game_rules_mixin.dart';

class StandardRules with GameRulesMixin {
  StandardRules() {
    setWinningMap({
      MoveType.rock: [MoveType.scissors],
      MoveType.paper: [MoveType.rock],
      MoveType.scissors: [MoveType.paper],
    });
  }
}
