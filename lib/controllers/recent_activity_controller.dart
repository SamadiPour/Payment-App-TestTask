import 'package:get/get.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';

class RecentActivityController extends GetxController {
  RxList<ActivityModel> _activities = <ActivityModel>[].obs;

  RxList<ActivityModel> get activities => _activities;

  double getTotalPrice() => activities.fold(
        0,
        (prev, element) =>
            prev +
            (element.type == ActivityType.topUp
                ? element.amount
                : -element.amount),
      );

  // when user add a activity
  addActivity(ActivityModel activity) {
    activities.insert(0, activity);
    update();
  }

  // it can be used after fetching from api or reading local storage
  setActivities(List<ActivityModel> activityList) {
    _activities = <ActivityModel>[].obs;
    activities.addAll(activityList);
    update();
  }
}
