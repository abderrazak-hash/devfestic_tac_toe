import 'package:flutter/material.dart';

class GameManager {
  int gameSize = 3;
  late List<List<Player>> game;
  late Player currentPlayer;

  GameManager(this.gameSize) {
    initGame();
  }

  void initGame() {
    game = List.generate(gameSize, (i) => List.generate(3, (j) => Player.N));
    currentPlayer = Player.X;
    endGame = null;
  }

  Player? testGame(Player player, int x, int y) {
    if (game[x].every((element) => element == player)) {
      return player;
    }
    if (game[0][y] == player && game[1][y] == player && game[2][y] == player) {
      return player;
    }
    if (game[0][0] == player && game[1][1] == player && game[2][2] == player) {
      return player;
    }
    if (game[0][2] == player && game[1][1] == player && game[2][0] == player) {
      return player;
    }
    if (!game.any((row) => row.any((box) => box == Player.N))) {
      return Player.N;
    }
    return null;
  }

  void playGame(int x, int y) {
    if (game[x][y] == Player.N) {
      game[x][y] = currentPlayer;
      endGame = testGame(currentPlayer, x, y);
      if (endGame == null) {
        currentPlayer = currentPlayer == Player.X ? Player.O : Player.X;
      } else {
        if (endGame == Player.X) {
          scoreX++;
        } else if (endGame == Player.O) {
          scoreO++;
        }
      }
    }
  }

  Player? endGame;
  int scoreO = 0;
  int scoreX = 0;

  // Player get nextPlayer =>
}

enum Player { X, O, N }
