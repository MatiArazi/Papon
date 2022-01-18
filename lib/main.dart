import 'package:flutter/material.dart';
import 'package:papon/buttons.dart';
import 'dart:io';

import 'package:papon/player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int numJugadores = 4;

  void addPlayers(int x) {
    setState(() {
      numJugadores += x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          title: Text('Papón'),
          backgroundColor: Colors.brown[600],
        ),
        floatingActionButton: Row(
          children: [
            FloatButton(Icon(Icons.remove), () {
              addPlayers(-1);
            }, numJugadores > 4, 'Sacar una persona',
                'No puede haber menos de 4 personas'),
            SizedBox(width: 20),
            FloatButton(Icon(Icons.add), () {
              addPlayers(1);
            }, numJugadores < 7, 'Agregar una persona',
                'No puede haber mas de 7 personas'),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.topRight,
          child: ListView(
            children: new List.generate(numJugadores, (index) => Player()),
          ),
        ),
      ),
    );
  }
}
