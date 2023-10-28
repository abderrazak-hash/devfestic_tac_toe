import 'package:flutter/material.dart';
import 'package:tic_tac_toe/colors.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/welcome_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
