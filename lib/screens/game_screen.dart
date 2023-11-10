import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedra_papel_game/domain/enums/move_type.dart';
import 'package:pedra_papel_game/domain/enums/rule_type.dart';
import 'package:pedra_papel_game/controllers/game.dart';
import 'package:pedra_papel_game/domain/interfaces/i_game.dart';
import 'package:pedra_papel_game/widgets/move_icons.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  MoveType? playerMove;
  MoveType? computerMove;
  String resultMessage = 'Escolha sua jogada para começar';
  bool hasGameStarted = false;
  RuleType selectedRuleType = RuleType.standard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione uma ação'),
      ),
      drawer: gameDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: MoveType.values
                    .take(getMovesQuantity(ruleType: selectedRuleType))
                    .map((move) {
                  return ChoiceChip(
                    showCheckmark: false,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    label: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Icon(getIconData(move), size: 25),
                        ),
                        Text(
                          move.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    selected: playerMove == move,
                    onSelected: (bool selected) {
                      playGame(move);
                    },
                    selectedColor: Colors.blue.shade100,
                    backgroundColor: Colors.grey.shade200,
                    shadowColor: Colors.transparent,
                  );
                }).toList(),
              ),
              if (hasGameStarted) ...<Widget>[
                const Divider(height: 50, thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildPlayerColumn(),
                    const Text('VS',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    _buildComputerColumn()
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  resultMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Drawer gameDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Menu de Jogos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.handScissors),
            title: const Text('Jogo padrão'),
            onTap: () {
              setState(() {
                selectedRuleType = RuleType.standard;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.handSpock),
            title: const Text('Big Bang Theory'),
            onTap: () {
              setState(() {
                selectedRuleType = RuleType.bigBangTheory;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.water),
            title: const Text('Extendido'),
            onTap: () {
              setState(() {
                selectedRuleType = RuleType.extended;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Column _buildPlayerColumn() {
    bool hasWon = resultMessage.contains('ganhou');
    return Column(
      children: <Widget>[
        const Text('Jogador', style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: hasWon ? Colors.green.shade100 : Colors.transparent,
            border: Border.all(
              color: hasWon ? Colors.green : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            playerMove != null
                ? getIconData(playerMove!)
                : FontAwesomeIcons.question,
            size: 60,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Column _buildComputerColumn() {
    bool hasLost = resultMessage.contains('perdeu');
    return Column(
      children: <Widget>[
        const Text('Oponente', style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: hasLost ? Colors.green.shade100 : Colors.transparent,
            border: Border.all(
              color: hasLost ? Colors.green : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            computerMove != null
                ? getIconData(computerMove!)
                : FontAwesomeIcons.question,
            size: 60,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  void playGame(MoveType playerChoice) {
    setState(() {
      playerMove = playerChoice;
      computerMove = null;
      resultMessage = 'Aguardando a jogada do oponente...';
    });

    Timer(const Duration(seconds: 2), () {
      final random = Random();
      MoveType computerChoice =
          MoveType.values[random.nextInt(getMovesQuantity(ruleType: selectedRuleType))];

      setState(() {
        computerMove = computerChoice;
        hasGameStarted = true;

        IGame game;
        switch (selectedRuleType) {
          case RuleType.standard:
            game = Game.withStandardRules(
                playerMove: playerMove!, computerMove: computerChoice);
            break;
          case RuleType.bigBangTheory:
            game = Game.withBigBangTheoryRules(
                playerMove: playerMove!, computerMove: computerChoice);
            break;
          case RuleType.extended:
            game = Game.withExtendedRules(
                playerMove: playerMove!, computerMove: computerChoice);
            break;
        }
        resultMessage = game.play();
      });
    });
  }

  int getMovesQuantity({required RuleType ruleType}) {
    switch (ruleType) {
      case RuleType.bigBangTheory:
        return 5;
      case RuleType.extended:
        return 17;
      default:
        return 3;
    }
  }
}
