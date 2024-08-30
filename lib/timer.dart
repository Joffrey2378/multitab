import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  Timer({
    required this.onEnd,
    required this.width,
    this.roundTime = 23,
  });

  final VoidCallback onEnd;
  final double width;
  final int roundTime;
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  late Animation _animate;

  Widget setText(text, size, color) => Text(text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none));

  @override
  void initState() {
    super.initState();
    _animate = StepTween(begin: widget.roundTime, end: 0).animate(
        AnimationController(
            duration: Duration(seconds: widget.roundTime), vsync: this)
          ..forward(from: 0.0))
      ..addStatusListener((AnimationStatus s) {
       if (s == AnimationStatus.completed) widget.onEnd();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
            animation: _animate,
            builder: (BuildContext, Widget) =>
                timerLayout(widget.width)
    //     setText(
    //     _animate.value.toString().padLeft(2, '0'),
    // widget.width * 0.12,
    // Colors.green),
        ),],
    );
  }

 Widget timerLayout(double clockWidth) {
   return Container(
     color: Colors.white,
     child: Column(
       children: [
         Container(
           height: 2,
           width: clockWidth * 2,
           decoration: BoxDecoration(color: Colors.black, boxShadow: [
             BoxShadow(
                 color: Colors.grey,
                 offset: Offset(0, 2),
                 spreadRadius: 2,
                 blurRadius: 4)
           ]),
         ),
         Container(
           width: clockWidth * 2 + 1,
           child: Row(
             children: [
               SizedBox(
                 width: clockWidth,
                 child: CupertinoPicker(
                   children: [
                     Text('0'),
                     Text('1'),
                     Text('2'),
                     Text('3'),
                     Text('4'),
                     Text('5'),
                     Text('6'),
                     Text('7'),
                     Text('8'),
                     Text('9'),
                   ],
                   itemExtent: 40,
                   looping: true, onSelectedItemChanged: (int value) {  },
                 ),
               ),
               Container(
                 height: 40,
                 width: 1,
                 color: Colors.grey,
               ),
               SizedBox(
                 width: clockWidth,
                 child: CupertinoPicker(
                   children: [
                     Text('0'),
                     Text('1'),
                     Text('2'),
                     Text('3'),
                     Text('4'),
                     Text('5'),
                     Text('6'),
                     Text('7'),
                     Text('8'),
                     Text('9'),
                   ],
                   itemExtent: 40,
                   looping: true, onSelectedItemChanged: (int value) {  },
                 ),
               )
             ],
           ),
         ),
         Container(
           height: 2,
           width: clockWidth * 2,
           decoration: BoxDecoration(color: Colors.black, boxShadow: [
             BoxShadow(
                 color: Colors.grey,
                 offset: Offset(0, -2),
                 spreadRadius: 2,
                 blurRadius: 4)
           ]),
         ),
       ],
     ),
   );
 }
}
