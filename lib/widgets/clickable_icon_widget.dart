import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClickableIconWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String svgPath;

  ClickableIconWidget({
    this.onPressed,
    required this.title,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Column(
        children: [
          SvgPicture.asset(svgPath),
          SizedBox(height: 3),
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      iconSize: 68,
      splashRadius: 50,
      onPressed: onPressed,
    );
  }
}
