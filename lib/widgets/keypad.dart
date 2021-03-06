import 'package:flutter/material.dart';
import 'package:payment_app_test_task/controllers/keypad_controller.dart';

class Keypad extends StatelessWidget {
  List<List> _keyRows = [
    // Row 1
    const [
      1,
      2,
      3,
    ],
    // Row 2
    const [
      4,
      5,
      6,
    ],
    // Row 3
    const [
      7,
      8,
      9,
    ],
  ];

  final KeypadController? controller;
  final double height;

  Keypad({this.controller, required this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height,
            maxWidth: 450,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _rows(),
            ),
          ),
        ),
      ),
    );
  }

  _rows() {
    return [
      // number rows
      for (var row in _keyRows) ...{
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // add number of each row
            for (var key in row) _numKey(key)
          ],
        ),
      },
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _dotKey(),
          _numKey(0),
          _backKey(),
        ],
      ),
    ];
  }

  Widget _numKey(int key) {
    return IconButton(
      onPressed: () {
        controller?.numberKeyPress(key);
      },
      icon: Text(
        key.toString(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      iconSize: 30,
      splashRadius: 25,
      color: Colors.white,
    );
  }

  Widget _dotKey() {
    return IconButton(
      onPressed: () {
        controller?.dotKeyPress();
      },
      icon: Text(
        '.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      ),
      iconSize: 30,
      splashRadius: 25,
      color: Colors.white,
    );
  }

  Widget _backKey() {
    return IconButton(
      onPressed: () {
        controller?.backKeyPress();
      },
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 24,
      ),
      color: Colors.white,
      iconSize: 30,
      splashRadius: 25,
    );
  }
}
