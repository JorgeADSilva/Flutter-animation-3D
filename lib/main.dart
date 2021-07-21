import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;

  get onChanged => null;

  void _incrementCounter(double value) {
    setState(() {
      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Center(
        child: FlipWidget(
            key: Key("Widget"),
            rotation: _counter,
            child: Container(
              color: Colors.black,
              child: Text(
                "1",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            )),
      ),
    ));
  }
}

class FlipWidget extends StatefulWidget {
  Widget child;
  double rotation;

  FlipWidget({required Key key, required this.child, required this.rotation})
      : super(key: key);

  @override
  _FlipWidgetState createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 30))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: List.generate(10, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              final rotationCalculated =
                  2 * pi * (_controller.value * 500) * 0.1 / 20 + (index * 0.7);
              return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(rotationCalculated)
                    ..translate(-120.0),
                  alignment: Alignment.center,
                  child: child);
            },
            child: RotatedBox(
                quarterTurns: 3,
                child: Container(
                  child: Text(
                    "Jorge Silva",
                    style:
                        TextStyle(color: Colors.white, fontSize: 70, shadows: [
                      Shadow(
                          color: Colors.grey.withOpacity(1),
                          offset: Offset(0, 2),
                          blurRadius: 2),
                    ]),
                  ),
                )),
          );
        }));
  }
}
