import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_state.dart';
import 'package:provider/provider.dart';

var x = 0, p1 = true;

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<GameState>(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "TIC TAC TOE",
                          style: TextStyle(fontSize: 40, color: Colors.indigo),
                        ),
                      ),
                      // Center(
                      //   child: InkWell(
                      //     child: Text('Player 1'),
                      //   ),
                      // )
                    ]),
              ),
              Expanded(
                  child: Row(
                    children: [
                      customBox(row: 0, col: 0),
                      customBox(row: 0, col: 1),
                      customBox(row: 0, col: 2),
                    ],
                  )),
              Expanded(
                  child: Row(
                    children: [
                      customBox(row: 1, col: 0),
                      customBox(row: 1, col: 1),
                      customBox(row: 1, col: 2),
                    ],
                  )),
              Expanded(
                  child: Row(
                    children: [
                      customBox(row: 2, col: 0),
                      customBox(row: 2, col: 1),
                      customBox(row: 2, col: 2),
                    ],
                  )),
              Expanded(child: Container()),
            ],
          ),
          if (state.winner == 1)
            Center(
              child: Container(
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: Text('Player 1 is winner',
                            style: TextStyle(fontSize: 40)),
                        height: 100,
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Play Again",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            x = 0;
                            p1 = true;
                          });
                          state.updateWinner();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (state.winner == -1)
            Center(
              child: Container(
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: Text('Player 2 is winner',
                            style: TextStyle(fontSize: 40)),
                        height: 100,
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Play Again",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            x = 0;
                            p1 = true;
                          });
                          state.updateWinner();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (state.winner == 2)
            Center(
              child: Container(
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child:
                        Text('Match draw', style: TextStyle(fontSize: 40)),
                        height: 100,
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Play Again",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            x = 0;
                            p1 = true;
                          });
                          state.updateWinner();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class customBox extends StatefulWidget {
  final row;
  final col;

  const customBox({super.key, required this.row, required this.col});

  @override
  State<customBox> createState() => _customBoxState(row, col);
}

class _customBoxState extends State<customBox> {
  var done = -1, row, col;

  _customBoxState(row, col) {
    this.row = row;
    this.col = col;
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<GameState>(context);

    return Expanded(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          // color: const Color(0xFFc6def1),
          // borderRadius: const BorderRadius.all(
          //   Radius.circular(15),
          // ),
            border: Border.all(color: Colors.black87)),
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            if (state.p1 == true && done != state.restart) {
              setState(() {
                x = 1;
                done = state.restart;
                state.mat[row][col] = 1;
              });
              state.checkMatrix();
              state.updateP1();

              print('x = $x');
              print('p1 = $p1');
            } else if (state.p1 == false && done != state.restart) {
              setState(() {
                x = 2;
                done = state.restart;
                state.mat[row][col] = -1;
              });
              state.checkMatrix();
              state.updateP1();
            } else {
              print('OOPS!!!');
            }
          },
          child: Image.asset(
            'assets/images/tic${x}.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
