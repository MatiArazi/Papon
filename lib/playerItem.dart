import 'package:flutter/material.dart';
import 'package:papon/buttons.dart';
import './models/player.dart';

class PlayerItem extends StatefulWidget {
  final int index;
  final int position;
  PlayerItem({Key? key, required this.index, required this.position})
      : super(key: key);

  @override
  _PlayerItemState createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  void addPoints(int x) {
    setState(() {
      players[widget.index].points += 2 * x;
    });
  }

  void addPapas(int x) {
    setState(() {
      players[widget.index].papas += 1 * x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.position == 1
                ? Colors.amber.shade300
                : widget.position == 2
                    ? Colors.grey
                    : widget.position == 3
                        ? Colors.brown.shade900
                        : Colors.brown.shade400,
            width: 4),
        borderRadius: BorderRadius.circular(8),
        color: Colors.brown.shade100,
      ),
      child: Row(
        children: [
          //Text('1'),
          //Spacer(),
          Container(
            width: 100,
            child: TextField(
              maxLength: 8,
              decoration: InputDecoration(hintText: 'Nombre'),
            ),
          ),
          Spacer(),
          Counter(
            count: players[widget.index].points,
            desc: 'Puntos',
            onChange: addPoints,
            color: Colors.teal.shade400,
          ),
          Spacer(),
          Counter(
            count: players[widget.index].papas,
            desc: 'Papas',
            onChange: addPapas,
            color: Colors.teal.shade300,
          ),
          //Spacer(),
        ],
      ),
    );
  }
}
