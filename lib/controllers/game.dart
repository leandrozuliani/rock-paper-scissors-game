import 'package:pedra_papel_game/domain/constants/actions_phrases.dart';
import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/domain/interfaces/i_game.dart';
import 'package:pedra_papel_game/domain/entities/rule.dart';
import 'package:pedra_papel_game/rules/big_bang_theory_rules.dart';
import 'package:pedra_papel_game/rules/default_rules.dart';
import 'package:pedra_papel_game/rules/extended_rules.dart';


class Game implements IGame {
  final MoveType playerMove;
  final MoveType computerMove;
  @override
  final Rule ruleSet;

  Game._(this.playerMove, this.computerMove, this.ruleSet);

  factory Game.withStandardRules(
      {required MoveType playerMove, required MoveType computerMove}) {
    return Game._(playerMove, computerMove, StandardRules());
  }

  factory Game.withBigBangTheoryRules(
      {required MoveType playerMove, required MoveType computerMove}) {
    return Game._(playerMove, computerMove, BigBangTheoryRules());
  }

  factory Game.withExtendedRules(
      {required MoveType playerMove, required MoveType computerMove}) {
    return Game._(playerMove, computerMove, ExtendedRules());
  }

  @override
  String play() {
    if (playerMove == computerMove) {
      return "Empate";
    }

    if (ruleSet.isWin(playerMove, computerMove)) {
      String playerPhrase =
          "${playerMove.name}_${computerMove.name}".toUpperCase();
      return "Você ganhou! ${playerMove.name} ${actionPhrases[playerPhrase] ?? "ganha de"} ${computerMove.name}";
    } else {
      String computerPhrase =
          "${computerMove.name}_${playerMove.name}".toUpperCase();
      return "Você perdeu! ${computerMove.name} ${actionPhrases[computerPhrase] ?? "ganha de"} ${playerMove.name}";
    }
  }
}
