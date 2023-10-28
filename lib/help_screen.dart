import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tik Tak Toe Help",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'This is Tic Tak Toe Game between X Player & O Player, while the winner is the one who set 3 Os/Xs in a row horizontally, vertically or diagonally.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Provided Features:',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1- Successive games and scoring follow',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2- Possibility to replay game during a running game',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '3- Impressive UI and agents representation',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
