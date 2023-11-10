import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedra_papel_game/domain/enums/move_type.dart';

IconData getIconData(MoveType move) {
    switch (move) {
      case MoveType.rock:
        return FontAwesomeIcons.handBackFist;
      case MoveType.paper:
        return FontAwesomeIcons.hand;
      case MoveType.scissors:
        return FontAwesomeIcons.handScissors;
      case MoveType.lizard:
        return FontAwesomeIcons.handLizard;
      case MoveType.spock:
        return FontAwesomeIcons.handSpock;
      case MoveType.fire:
        return FontAwesomeIcons.fire;
      case MoveType.snake:
        return FontAwesomeIcons.staffSnake;
      case MoveType.human:
        return FontAwesomeIcons.user;
      case MoveType.tree:
        return FontAwesomeIcons.tree;
      case MoveType.wolf:
        return FontAwesomeIcons.wolfPackBattalion;
      case MoveType.sponge:
        return FontAwesomeIcons.biohazard;
      case MoveType.air:
        return FontAwesomeIcons.wind;
      case MoveType.water:
        return FontAwesomeIcons.water;
      case MoveType.dragon:
        return FontAwesomeIcons.dragon;
      case MoveType.devil:
        return FontAwesomeIcons.pooStorm;
      case MoveType.lightning:
        return FontAwesomeIcons.bolt;
      case MoveType.gun:
        return FontAwesomeIcons.gun;
      default:
        return FontAwesomeIcons.question;
    }
  }