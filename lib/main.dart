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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Slider(
              value: _counter,
              onChanged: _incrementCounter,
              min: -120,
              max: 120,
            ),
            Center(
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
          ],
        ) /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_counter.toString()),
            Slider(
              value: _counter,
              onChanged: _incrementCounter,
              min: -120,
              max: 120,
            ),
            FlipWidget(
                key: Key("Widget"),
                rotation: _counter,
                child: Container(
                  color: Colors.black,
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ))
          ],
        ),
      ),*/
        );
  }
}

class FlipWidget extends StatelessWidget {
  Widget child;
  double rotation;

  FlipWidget({required Key key, required this.child, required this.rotation})
      : super(key: key);

//SEE: https://www.instagram.com/p/CRZV9E4CZAq/
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: List.generate(10, (index) {
          final rotationCalculated =
              2 * pi * rotation * 0.1 / 20 + (index * 0.7);
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotationCalculated)
              ..translate(-120.0),
            alignment: Alignment.center,
            child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "Ola",
                  style: TextStyle(fontSize: 30),
                )),
          );
        })
        /*Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.01)
            ..translate(-120)
            ..rotateY(rotation),
          alignment: Alignment.center,
          child: ClipRect(
              child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 1,
            child: child,
          )),
        ),*/
        );
  }
}
