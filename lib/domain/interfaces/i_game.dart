import 'package:pedra_papel_game/domain/entities/rule.dart';

abstract class IGame {
  String play();
  Rule get ruleSet;
}