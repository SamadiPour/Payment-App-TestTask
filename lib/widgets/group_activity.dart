import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';
import 'package:payment_app_test_task/widgets/activity_widget.dart';

class GroupActivity extends StatelessWidget {
  final List<ActivityModel> activities;

  const GroupActivity({required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildWidgets(),
    );
  }

  List<Widget> _buildWidgets() {
    final widgets = <Widget>[];
    if (activities.isEmpty) return widgets;

    final now = DateTime.now();

    var lastSeenDay;
    for (var activity in activities) {
      if (lastSeenDay != activity.date.day) {
        lastSeenDay = activity.date.day;

        switch (now.difference(activity.date).inDays) {
          case 0:
            widgets.add(_dateTitle('today'));
            break;
          case 1:
            widgets.add(_dateTitle('yesterday'));
            break;
          default:
            widgets.add(_dateTitle(DateFormat("d MMMM").format(activity.date)));
            break;
        }
      }
      widgets.add(ActivityWidget(activity));
    }

    return widgets;
  }

  _dateTitle(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          date.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: GlobalColors.secondaryDark,
          ),
        ),
      ),
    );
  }
}
