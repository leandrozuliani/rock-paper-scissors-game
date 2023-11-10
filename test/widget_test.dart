import 'package:flutter_test/flutter_test.dart';
import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/controllers/game.dart';

void main() {
  group('Game withBigBangTheoryRules', () {
    String youWon = "Você ganhou!";
    String youLose = "Você perdeu!";

    test('rock should crush scissors', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.rock, computerMove: MoveType.scissors);
      expect(game.play(), '$youWon rock esmaga scissors');
    });

    test('scissors should cut paper', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.scissors, computerMove: MoveType.paper);
      expect(game.play(), '$youWon scissors corta paper');
    });

    test('paper should cover rock', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.paper, computerMove: MoveType.rock);
      expect(game.play(), '$youWon paper cobre rock');
    });

    test('game should result in a tie if both players choose the same', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.rock, computerMove: MoveType.rock);
      expect(game.play(), 'Empate');
    });

    test('rock should crush lizard', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.rock, computerMove: MoveType.lizard);
      expect(game.play(), '$youWon rock esmaga lizard');
    });

    test('lizard should poison spock', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.lizard, computerMove: MoveType.spock);
      expect(game.play(), '$youWon lizard envenena spock');
    });

    test('spock should smash scissors', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.spock, computerMove: MoveType.scissors);
      expect(game.play(), '$youWon spock esmigalha scissors');
    });

    test('scissors should decapitate lizard', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.scissors, computerMove: MoveType.lizard);
      expect(game.play(), '$youWon scissors decapita lizard');
    });

    test('lizard should eat paper', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.lizard, computerMove: MoveType.paper);
      expect(game.play(), '$youWon lizard come paper');
    });

    test('paper should disprove spock', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.paper, computerMove: MoveType.spock);
      expect(game.play(), '$youWon paper refuta spock');
    });

    test('spock should vaporize rock', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.spock, computerMove: MoveType.rock);
      expect(game.play(), '$youWon spock vaporiza rock');
    });

    test('opposite action should return reverse phrase', () {
      final game = Game.withBigBangTheoryRules(
          playerMove: MoveType.scissors, computerMove: MoveType.rock);
      expect(game.play(), '$youLose rock esmaga scissors');
    });
  });
}
