import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_test_task/controllers/recent_activity_controller.dart';
import 'package:payment_app_test_task/data/dummy_activities.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';
import 'package:payment_app_test_task/screens/add_activity/add_activity_screen.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';
import 'package:payment_app_test_task/widgets/clickable_icon_widget.dart';
import 'package:payment_app_test_task/widgets/custom_app_bar.dart';
import 'package:payment_app_test_task/widgets/group_activity.dart';
import 'package:payment_app_test_task/widgets/price_widget.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final RecentActivityController _recentActivityController = Get.find();

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: GlobalColors.lightWhite,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 29),
                  child: PriceWidget(
                    price: _recentActivityController.getTotalPrice(),
                    baseSize: 25,
                  ),
                ),
              ),
            ),
            _floatingPanel(context),
            _recentActivity(context),
          ],
        ),
      ),
    );
  }

  _floatingPanel(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: GlobalColors.lightWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    ClickableIconWidget(
                      title: 'Pay',
                      svgPath: 'assets/icons/phone_icon.svg',
                      onPressed: () {
                        Get.to(
                          () => AddActivityScreen(type: ActivityType.pay),
                        );
                      },
                    ),
                    ClickableIconWidget(
                      title: 'Top up',
                      svgPath: 'assets/icons/wallet_icon.svg',
                      onPressed: () {
                        Get.to(
                          () => AddActivityScreen(type: ActivityType.topUp),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _recentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Recent Activity',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: GlobalColors.hover,
            ),
          ),
        ),
        SizedBox(height: 6),
        GroupActivity(activities: _recentActivityController.activities),
      ],
    );
  }

  // this should not be here
  // only for demo
  // currently getting from dummy data
  void fetchApi() {
    final activityList = <ActivityModel>[];
    for (var activity in dummyActivities) {
      activityList.add(ActivityModel.fromJson(activity));
    }
    _recentActivityController.setActivities(activityList);
  }
}
