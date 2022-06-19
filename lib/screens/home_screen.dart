import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final verticalSpace = const SizedBox(height: 30);
  bool isTurnO = true;
  final xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnigText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X O'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              compeleteReset();
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset The Game',
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace,
            getScoreBoared(),
            verticalSpace,
            getResultButton(),
            verticalSpace,
            getGridView(),
            verticalSpace,
            getTurn()
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    if (gameHasResult) {
      return;
    }
    setState(
      () {
        if (xOrOList[index].isNotEmpty) {
          return;
        }
        if (isTurnO) {
          xOrOList[index] = 'O';
          filledBoxes++;
        } else {
          xOrOList[index] = 'X';
          filledBoxes++;
        }
        isTurnO = !isTurnO;

        checkWinner();
      },
    );
  }

  checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0].isNotEmpty) {
      setWinner(xOrOList[0], 'Player ' + xOrOList[0] + ' Win!');

      return;
    } else if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3].isNotEmpty) {
      setWinner(xOrOList[3], 'Player ' + xOrOList[3] + ' Win!');

      return;
    } else if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6].isNotEmpty) {
      setWinner(xOrOList[6], 'Player ' + xOrOList[6] + ' Win!');

      return;
    } else if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0].isNotEmpty) {
      setWinner(xOrOList[0], 'Player ' + xOrOList[0] + ' Win!');

      return;
    } else if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1].isNotEmpty) {
      setWinner(xOrOList[1], 'Player ' + xOrOList[1] + ' Win!');

      return;
    } else if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2].isNotEmpty) {
      setWinner(xOrOList[2], 'Player ' + xOrOList[2] + ' Win!');

      return;
    } else if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0].isNotEmpty) {
      setWinner(xOrOList[0], 'Player ' + xOrOList[0] + ' Win!');

      return;
    } else if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2].isNotEmpty) {
      setWinner(xOrOList[2], 'Player ' + xOrOList[2] + ' Win!');

      return;
    }

    if (filledBoxes == 9) {
      setWinner('', 'NO ONE WIN!!!');
    }
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'TURN : O' : 'TURN : X',
      style: TextStyle(
        fontSize: 24,
        color: Colors.grey[200],
      ),
    );
  }

  Padding getGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(61, 158, 158, 158),
                  ),
                  child: Center(
                    child: Text(
                      xOrOList[index],
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color:
                            xOrOList[index] == 'X' ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Row getScoreBoared() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              'PLAYER : X',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '$scoreX',
              style: const TextStyle(color: Colors.grey, fontSize: 24),
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'PLAYER : O',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '$scoreO',
              style: const TextStyle(color: Colors.grey, fontSize: 24),
            )
          ],
        )
      ],
    );
  }

  compeleteReset() {
    setState(
      () {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
        filledBoxes = 0;
        scoreO = 0;
        scoreX = 0;
        gameHasResult = false;
      },
    );
  }

  turnReset() {
    setState(
      () {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
        filledBoxes = 0;
      },
    );
  }

  setWinner(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnigText = title;
      if (winner == 'X') {
        scoreX += 1;
      } else if (winner == 'O') {
        scoreO += 1;
      } else {
        scoreO += 0;
        scoreX += 0;
      }
    });
  }

  getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () {
          setState(() {
            gameHasResult = false;
            turnReset();
          });
        },
        child: Text(
          winnigText + ' PLAY AGAIN?',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
