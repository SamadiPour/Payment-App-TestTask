import 'package:flutter/material.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';

class ActivityPriceWidget extends StatelessWidget {
  final double price;
  final double baseSize;
  final Color textColor;
  final double diffSize;
  final bool isTopUp;

  ActivityPriceWidget({
    required this.price,
    this.baseSize = 16,
    this.textColor = Colors.black,
    this.diffSize = 6,
    this.isTopUp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (isTopUp)
            TextSpan(
              text: '+',
              style: TextStyle(
                fontSize: baseSize + diffSize,
              ),
            ),
          TextSpan(
            text: price.toInt().toString(),
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
        color: isTopUp ? GlobalColors.primary : textColor,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
