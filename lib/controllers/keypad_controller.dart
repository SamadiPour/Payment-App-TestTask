import 'package:get/get.dart';
import 'package:payment_app_test_task/models/keypad_status.dart';

class KeypadController extends GetxController {
  RxDouble _amount = 0.0.obs;
  KeypadState _state = KeypadState.number;
  static const int _limit = 999999999;

  RxDouble get amount => _amount;

  void numberKeyPress(int number) {
    double value = _amount.value;

    switch (_state) {
      case KeypadState.number:
        value = (value * 10) + number;
        if (value > _limit) return;
        break;
      case KeypadState.firstFraction:
        value = value + (number / 10);
        _state = KeypadState.secondFraction;
        break;
      case KeypadState.secondFraction:
        value = value + (number / 100);
        _state = KeypadState.done;
        break;
      case KeypadState.done:
        break;
    }

    _amount.value = value;
    update();
  }

  void dotKeyPress() {
    if (_state == KeypadState.number) {
      _state = KeypadState.firstFraction;
    }
  }

  void backKeyPress() {
    double value = _amount.value;

    switch (_state) {
      case KeypadState.done:
        value = value - ((value * 100) % 10) / 100;
        _state = KeypadState.secondFraction;
        break;
      case KeypadState.secondFraction:
        value = value - ((value * 10) % 10) / 10;
        _state = KeypadState.firstFraction;
        break;
      case KeypadState.firstFraction:
        value = (value ~/ 10).toDouble();
        _state = KeypadState.number;
        break;
      case KeypadState.number:
        value = (value ~/ 10).toDouble();
        break;
    }

    _amount.value = value;
    update();
  }
}
