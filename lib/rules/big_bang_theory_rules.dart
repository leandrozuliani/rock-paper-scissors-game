import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/domain/mixins/game_rules_mixin.dart';

class BigBangTheoryRules with GameRulesMixin {
  BigBangTheoryRules() {
    setWinningMap({
      MoveType.rock: [MoveType.scissors, MoveType.lizard],
      MoveType.paper: [MoveType.rock, MoveType.spock],
      MoveType.scissors: [MoveType.paper, MoveType.lizard],
      MoveType.lizard: [MoveType.spock, MoveType.paper],
      MoveType.spock: [MoveType.scissors, MoveType.rock],
    });
  }
}
