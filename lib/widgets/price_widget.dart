import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final double baseSize;
  final Color textColor;
  final double diffSize;

  PriceWidget({
    required this.price,
    this.baseSize = 15,
    this.textColor = Colors.white,
    this.diffSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '£ ',
            style: TextStyle(
              fontSize: baseSize,
            ),
          ),
          TextSpan(
            text: price.toInt().abs().toString(),
            style: TextStyle(
              fontSize: baseSize + diffSize,
            ),
          ),
          TextSpan(
            text: '.' + price.toStringAsFixed(2).split('.')[1],
            style: TextStyle(
              fontSize: baseSize,
            ),
          ),
        ],
      ),
      style: TextStyle(
        color: price.isNegative
            ? Colors.red // bad red. needs better one.
            : textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
