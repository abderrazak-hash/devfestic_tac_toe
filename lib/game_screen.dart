import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/colors.dart';
import 'package:tic_tac_toe/game_manager.dart';

class TikTakToe extends StatefulWidget {
  final int gameSize;
  const TikTakToe({super.key, required this.gameSize});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  late GameManager gameManager;

  @override
  void initState() {
    super.initState();
    gameManager = GameManager(widget.gameSize);
    gameManager.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Tik Tak Toe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset("assets/X.svg")),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${gameManager.scoreX} - ${gameManager.scoreO}",
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset("assets/O.svg")),
              ],
            ),
            const Spacer(),
            ...List.generate(
              gameManager.gameSize,
              (i) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  gameManager.gameSize,
                  (j) => InkWell(
                    onTap: () {
                      setState(() {
                        gameManager.playGame(i, j);
                      });
                      if (gameManager.endGame != null) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  gameManager.endGame != Player.N
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: SvgPicture.asset(
                                                    "assets/${gameManager.endGame == Player.X ? "X" : "O"}.svg")),
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                " WON",
                                                style: TextStyle(
                                                  fontSize: 38,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Text(
                                          "It's Draw",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        gameManager.initGame();
                                      });
                                    },
                                    child: Container(
                                      height: 55.0,
                                      width: 150.0,
                                      padding: const EdgeInsets.all(8.0),
                                      margin: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 234, 131, 41),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.replay,
                                              size: 35,
                                              color: white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "RESTART",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: const Color.fromARGB(255, 224, 160, 247),
                          border: Border.all(
                            width: 3,
                            color: Colors.grey,
                          )),
                      child: Center(
                        child: gameManager.game[i][j] != Player.N
                            ? Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SvgPicture.asset(
                                    gameManager.game[i][j] == Player.X
                                        ? "assets/X.svg"
                                        : "assets/O.svg"),
                              )
                            : const Center(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  gameManager.initGame();
                });
              },
              child: Container(
                height: 60.0,
                width: 180.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 131, 41),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.replay,
                        size: 45,
                        color: white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "REPLAY",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
