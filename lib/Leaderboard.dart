import 'package:flutter/material.dart';
import './models/player.dart';

class Leaderboard extends StatelessWidget {
  final List<Player> players;
  const Leaderboard(this.players);

  @override
  Widget build(BuildContext context) {
    players.sort((a, b) => a.points.compareTo(b.points));
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          int i = players.length - index -1;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '${index+1} ${players[i].name} - ${players[i].points} pts',
              style: TextStyle(
                fontWeight: index <3 ?FontWeight.bold: FontWeight.normal,
                fontSize: index < 1 ? 38: index <2 ? 30 : index<3 ? 24 : 18,
                color: index < 1 ? Colors.amber.shade300 : index <2 ? Colors.grey : index<3 ? Colors.brown.shade700 : Colors.black
              ),
            ),
          );
        },
        itemCount: players.length,
      ),
    );
  }
}
