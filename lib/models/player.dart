import 'package:flutter/foundation.dart';

class Player{
  String id;
  String name = 'Nombre';
  int points = 0;
  int papas = 0;
  Player(this.id);
}

List<Player> players = [];