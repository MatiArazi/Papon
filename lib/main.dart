import 'package:flutter/material.dart';
import 'package:papon/Leaderboard.dart';
import 'package:papon/buttons.dart';
import 'package:papon/models/player.dart';

import 'package:papon/playerItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeAppState();
  }
}

class _MyHomeAppState extends State<MyHomeApp> {
  int ids = 0;

  void _showLeaderboard(BuildContext ctx) {
    showModalBottomSheet<void>(
      context: ctx,
      builder: (_) {
        return Leaderboard(players);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var pl in players) {
      print(pl.name + ' ${pl.points}');
    }
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: const Text('Papón'),
        backgroundColor: Colors.brown[600],
        actions: [
          IconButton(
            onPressed: () => _showLeaderboard(context),
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatButton(const Icon(Icons.add), () {
        setState(() {
          players.add(Player('p$ids'));
          ids++;
        });
      }, players.length < 7, 'Agregar un jugador',
          'No puede haber mas de 7 jugadores'),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.topRight,
          child: ReorderableListView.builder(
            itemBuilder: (ctx, index) {
              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(players[index].id),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    players.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Se cayo un hombre')));
                },
                child: ListTile(
                  title: PlayerItem(index: index, position: 5),
                ),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: const Text(
                    'Adios',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            itemCount: players.length,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Player item = players.removeAt(oldIndex);
                players.insert(newIndex, item);
              });
            },
          )),
    );
  }
}
