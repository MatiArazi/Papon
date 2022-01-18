import 'package:flutter/material.dart';
import 'package:papon/buttons.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var points = 0;
  var papas = 0;

  void addPoints(int x) {
    setState(() {
      points += x;
    });
  }

  void addPapas(int x) {
    setState(() {
      papas += x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),

      child: Row(
        children: [
          //Text('1'),
          //Spacer(),
          Container(
            width: 100,
            child: TextField(maxLength: 8,),
          ),
          Spacer(),
          Counter('Puntos', 2),
          Spacer(),
          Counter('Papas', 1),
          //Spacer(),
        ],
      ),
    );
  }
}
