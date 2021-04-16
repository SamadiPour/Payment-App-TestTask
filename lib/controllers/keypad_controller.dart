import 'package:get/get.dart';

class KeypadController extends GetxController {
  RxDouble _amount = 0.0.obs;
  List _partActive = [true, false, false];
  static const int _limit = 9999999;

  RxDouble get amount => _amount;

  // get current status
  get _isNumberPart => _partActive[0] && !_partActive[1] && !_partActive[2];

  get _isFirstFraction => !_partActive[0] && _partActive[1] && !_partActive[2];

  get _isSecondFraction => !_partActive[0] && !_partActive[1] && _partActive[2];

  get _isDone => !_partActive[0] && !_partActive[1] && !_partActive[2];

  void _isFraction() => _isFirstFraction || _isSecondFraction;

  // set status
  void _goNumberPart() => _partActive = [true, false, false];

  void _goFirstFraction() => _partActive = [false, true, false];

  void _goSecondFraction() => _partActive = [false, false, true];

  void _goDone() => _partActive = [false, false, false];

  void numberKeyPress(int number) {
    double value = _amount.value;

    if (_isNumberPart) {
      value = (value * 10) + number;
      if (value > _limit) return;
    } else if (_isFirstFraction) {
      value = value + (number / 10);
      _goSecondFraction();
    } else if (_isSecondFraction) {
      value = value + (number / 100);
      _goDone();
    }

    _amount.value = value;
    update();
  }

  void dotKeyPress() {
    if (_isNumberPart) {
      _goFirstFraction();
    }
  }

  void backKeyPress() {
    double value = _amount.value;

    if (_isDone) {
      value = value - ((value * 100) % 10) / 100;
      _goSecondFraction();
    } else if (_isSecondFraction) {
      value = value - ((value * 10) % 10) / 10;
      _goFirstFraction();
    } else if (_isFirstFraction) {
      value = (value ~/ 10).toDouble();
      _goNumberPart();
    } else {
      value = (value ~/ 10).toDouble();
    }

    _amount.value = value;
    update();
  }
}
