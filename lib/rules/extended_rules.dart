import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/domain/mixins/game_rules_mixin.dart';

class ExtendedRules with GameRulesMixin {
  ExtendedRules() {
    setWinningMap({
      MoveType.rock: [
        MoveType.fire,
        MoveType.scissors,
        MoveType.snake,
        MoveType.human,
        MoveType.tree,
        MoveType.wolf,
        MoveType.sponge
      ],
      MoveType.gun: [
        MoveType.rock,
        MoveType.fire,
        MoveType.scissors,
        MoveType.snake,
        MoveType.human,
        MoveType.tree,
        MoveType.wolf
      ],
      MoveType.lightning: [
        MoveType.tree,
        MoveType.human,
        MoveType.snake,
        MoveType.scissors,
        MoveType.fire,
        MoveType.rock,
        MoveType.gun
      ],
      MoveType.devil: [
        MoveType.lightning,
        MoveType.tree,
        MoveType.human,
        MoveType.snake,
        MoveType.scissors,
        MoveType.fire,
        MoveType.rock
      ],
      MoveType.dragon: [
        MoveType.devil,
        MoveType.lightning,
        MoveType.tree,
        MoveType.human,
        MoveType.snake,
        MoveType.scissors,
        MoveType.fire
      ],
      MoveType.water: [
        MoveType.dragon,
        MoveType.devil,
        MoveType.lightning,
        MoveType.tree,
        MoveType.human,
        MoveType.snake,
        MoveType.scissors
      ],
      MoveType.air: [
        MoveType.water,
        MoveType.dragon,
        MoveType.devil,
        MoveType.lightning,
        MoveType.tree,
        MoveType.human,
        MoveType.snake
      ],
      MoveType.paper: [
        MoveType.air,
        MoveType.water,
        MoveType.dragon,
        MoveType.devil,
        MoveType.lightning,
        MoveType.tree,
        MoveType.human
      ],
      MoveType.sponge: [
        MoveType.paper,
        MoveType.air,
        MoveType.water,
        MoveType.dragon,
        MoveType.devil,
        MoveType.lightning,
        MoveType.tree
      ],
      MoveType.wolf: [
        MoveType.sponge,
        MoveType.paper,
        MoveType.air,
        MoveType.water,
        MoveType.dragon,
        MoveType.devil,
        MoveType.lightning
      ],
      MoveType.tree: [
        MoveType.wolf,
        MoveType.sponge,
        MoveType.paper,
        MoveType.air,
        MoveType.water,
        MoveType.dragon,
        MoveType.devil
      ],
      MoveType.human: [
        MoveType.tree,
        MoveType.wolf,
        MoveType.sponge,
        MoveType.paper,
        MoveType.air,
        MoveType.water,
        MoveType.dragon
      ],
      MoveType.snake: [
        MoveType.human,
        MoveType.tree,
        MoveType.wolf,
        MoveType.sponge,
        MoveType.paper,
        MoveType.air,
        MoveType.water
      ],
      MoveType.scissors: [
        MoveType.snake,
        MoveType.human,
        MoveType.tree,
        MoveType.wolf,
        MoveType.sponge,
        MoveType.paper,
        MoveType.air
      ],
      MoveType.fire: [
        MoveType.scissors,
        MoveType.snake,
        MoveType.human,
        MoveType.tree,
        MoveType.wolf,
        MoveType.sponge,
        MoveType.paper
      ]
    });
  }
}
