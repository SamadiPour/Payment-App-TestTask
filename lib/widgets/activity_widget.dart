import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';
import 'package:payment_app_test_task/widgets/activity_price_widget.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activity;

  ActivityWidget(this.activity);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              activity.type == ActivityType.pay
                  ? 'assets/icons/payment_icon.svg'
                  : 'assets/icons/topup_icon.svg',
            ),
            SizedBox(width: 8),
            Text(
              activity.title != null ? activity.title! : 'Top Up',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            ActivityPriceWidget(
              price: activity.amount,
              type: activity.type,
            ),
          ],
        ),
      ),
    );
  }
}
