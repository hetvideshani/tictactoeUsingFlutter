import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tic_tac_toe.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState(){
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TicTacToe()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'TIC TAC TOE',
              style: TextStyle(
                fontSize: 40,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
