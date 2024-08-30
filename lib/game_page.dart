import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multitab/game_model.dart';
import 'package:multitab/timer.dart';

class GamePage extends StatefulWidget {
  final GameModel? gameModel;

  const GamePage({Key? key, this.gameModel}) : super(key: key);

  static Future<void> show(BuildContext context, {GameModel? gameModel}) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GamePage(
        gameModel: gameModel,
      ),
      fullscreenDialog: true,
    ));
  }

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  TextEditingController _controller = TextEditingController();
  late Random random;
   int? a;
   int? b;

  int _generateNumbers(int? previousNumber) {
    int randomNumber = random.nextInt(8) + 2;

    if (randomNumber == previousNumber) {
      _generateNumbers(previousNumber);
    }
    return randomNumber;
  }

  void _nextQuestion() {
    setState(() {
      _controller.clear();
      a = _generateNumbers(a);
      b = _generateNumbers(b);
    });
  }

  void _submitAnswer() {
    int answer = int.tryParse(_controller.text) ?? 0;
    if (answer == a! * b!) {
      _nextQuestion();
    }
  }

  Widget _contents() {
    double clockWidth = 30;
    return Column(
      children: [
        Timer(
          width: clockWidth,
          onEnd: () {
            // TODO: stop game and show results
          },
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$a x $b',
                  style: TextStyle(fontSize: 80.0, color: Colors.indigo),
                ),
                Container(
                  width: 100.0,
//              color: Colors.orange,
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    onEditingComplete: _submitAnswer,
                    decoration: InputDecoration(border: InputBorder.none),
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ],
            ),
          ),
        ),
//        timerLayout(clockWidth),
      ],
    );
  }

  @override
  void initState() {
    random = Random();
    a = _generateNumbers(a);
    b = _generateNumbers(b);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MultiTab'),
          centerTitle: true,
        ),
        body: _contents());
  }
}
