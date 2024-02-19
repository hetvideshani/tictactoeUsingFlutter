import 'package:flutter/foundation.dart';

class GameState extends ChangeNotifier {
  bool _p1 = true;
  var _person = 1, _winner = 0, _restart = 0;

  var _mat = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  bool get p1 => _p1;

  // get x => _x;

  get person => _person;

  get winner => _winner;

  get mat => _mat;

  get restart => _restart;

  int checkMatrix() {
    if ((_mat[0][0] == 1 && _mat[0][1] == 1 && _mat[0][2] == 1) ||
        (_mat[1][0] == 1 && _mat[1][1] == 1 && _mat[1][2] == 1) ||
        (_mat[2][0] == 1 && _mat[2][1] == 1 && _mat[2][2] == 1) ||
        (_mat[0][0] == 1 && _mat[1][0] == 1 && _mat[2][0] == 1) ||
        (_mat[0][1] == 1 && _mat[1][1] == 1 && _mat[2][1] == 1) ||
        (_mat[0][2] == 1 && _mat[1][2] == 1 && _mat[2][2] == 1) ||
        (_mat[0][0] == 1 && _mat[1][1] == 1 && _mat[2][2] == 1) ||
        (_mat[0][2] == 1 && _mat[1][1] == 1 && _mat[2][0] == 1)) {
      _winner = 1;
      notifyListeners();
    } else if ((_mat[0][0] == -1 && _mat[0][1] == -1 && _mat[0][2] == -1) ||
        (_mat[1][0] == -1 && _mat[1][1] == -1 && _mat[1][2] == -1) ||
        (_mat[2][0] == -1 && _mat[2][1] == -1 && _mat[2][2] == -1) ||
        (_mat[0][0] == -1 && _mat[1][0] == -1 && _mat[2][0] == -1) ||
        (_mat[0][1] == -1 && _mat[1][1] == -1 && _mat[2][1] == -1) ||
        (_mat[0][2] == -1 && _mat[1][2] == -1 && _mat[2][2] == -1) ||
        (_mat[0][0] == -1 && _mat[1][1] == -1 && _mat[2][2] == -1) ||
        (_mat[0][2] == -1 && _mat[1][1] == -1 && _mat[2][0] == -1)) {
      _winner = -1;
      notifyListeners();
    }else if((_mat[0][0] != 0 && _mat[0][1] != 0 && _mat[0][2] != 0) &&
        (_mat[1][0] != 0 && _mat[1][1] != 0 && _mat[1][2] != 0) &&
        (_mat[2][0] != 0 && _mat[2][1] != 0 && _mat[2][2] != 0) &&
        (_mat[0][0] != 0 && _mat[1][0] != 0 && _mat[2][0] != 0) &&
        (_mat[0][1] != 0 && _mat[1][1] != 0 && _mat[2][1] != 0) &&
        (_mat[0][2] != 0 && _mat[1][2] != 0 && _mat[2][2] != 0) &&
        (_mat[0][0] != 0 && _mat[1][1] != 0 && _mat[2][2] != 0) &&
        (_mat[0][2] != 0 && _mat[1][1] != 0 && _mat[2][0] != 0)) {
      _winner = 2;
      notifyListeners();
    }

    return _winner;
  }

  void updateWinner() {
    _winner = 0;
    _restart++;

    _mat = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ];
    _p1 = true;

    notifyListeners();
  }

  void updateP1() {
    if (_p1 == true) {
      _p1 = false;
      _person = 2;
    } else if (_p1 == false) {
      _p1 = true;
      _person = 1;
    }
  }

  String getPerson() {
    print('$_person');
    return _person.toString();
  }
}
