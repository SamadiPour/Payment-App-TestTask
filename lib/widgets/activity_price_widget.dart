import 'package:flutter/material.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';
import 'package:payment_app_test_task/utils/tools.dart';

class ActivityPriceWidget extends StatelessWidget {
  final double price;
  final double baseSize;
  final Color textColor;
  final double diffSize;
  final ActivityType type;

  ActivityPriceWidget({
    required this.price,
    required this.type,
    this.baseSize = 16,
    this.textColor = Colors.black,
    this.diffSize = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (type == ActivityType.topUp)
            TextSpan(
              text: '+',
              style: TextStyle(
                fontSize: baseSize + diffSize,
              ),
            ),
          TextSpan(
            text: formatPrice(price.toInt()),
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
        color: type == ActivityType.topUp ? GlobalColors.primary : textColor,
        fontWeight: FontWeight.w300,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
