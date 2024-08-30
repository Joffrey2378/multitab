import 'package:flutter/material.dart';
import 'package:multitab/game_page.dart';

class LandingPage extends StatelessWidget {
  late double containerSize;
  final int tableSize = 10;

  @override
  Widget build(BuildContext context) {
    containerSize = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lets master multiplying'),
      ),
      body: buildContent(context),
    );
  }

  Map<int, Color> containerColor = {
    1: Colors.red,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.lightGreenAccent,
    5: Colors.lightBlueAccent,
    6: Colors.blueAccent,
    7: Colors.purpleAccent,
    8: Colors.pinkAccent,
    9: Colors.cyan,
    10: Colors.indigo,
  };

  List<Container> getContainer(int rowNumber) {
    List<Container> result = [];
    for (int i = 1; i <= tableSize; i++) {
      int number = rowNumber * i;
      result.add(Container(
        color: i >= rowNumber ? containerColor[i] : null,
        width: containerSize,
        height: containerSize,
        child: Center(child: Text('$number', style: TextStyle(fontSize: 23))),
      ));
    }
    return result;
  }

  List<Widget> listRows() {
    List<Widget> result = [];
    for (int i = 1; i <= tableSize; i++) {
      result.add(Container(
        color: containerColor[i],
        child: Row(
          children: getContainer(i),
        ),
      ));
    }
    return result;
  }

  Widget buildContent(BuildContext context) {
    return Center(
        child: ListView(
      children: [
        Column(
          children: listRows(),
        ),
        ElevatedButton(
          child: Text('Start game'),
          onPressed: () => GamePage.show(context),
        ),
      ],
    ));
  }
}
