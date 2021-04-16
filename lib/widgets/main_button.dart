import 'package:flutter/material.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';

class MainButton extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? onPressed;

  MainButton({
    this.width = 175,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            GlobalColors.lightWhite.withOpacity(0.5),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
