import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_test_task/controllers/keypad_controller.dart';
import 'package:payment_app_test_task/controllers/page_fragments_controller.dart';
import 'package:payment_app_test_task/controllers/recent_activity_controller.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';
import 'package:payment_app_test_task/widgets/keypad.dart';
import 'package:payment_app_test_task/widgets/main_button.dart';
import 'package:payment_app_test_task/widgets/price_widget.dart';

class AddActivityMoneyFragment extends StatefulWidget {
  final ActivityType type;

  AddActivityMoneyFragment({required this.type});

  @override
  _AddActivityMoneyFragmentState createState() =>
      _AddActivityMoneyFragmentState();
}

class _AddActivityMoneyFragmentState extends State<AddActivityMoneyFragment> {
  final _keypadController = KeypadController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 45),
              Center(
                child: Text(
                  'How Much?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 45),
              Center(
                child: Container(
                  height: 80,
                  child: FittedBox(
                    child: Obx(
                      () => PriceWidget(
                        price: _keypadController.amount.value,
                        baseSize: 20,
                        diffSize: 45,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Keypad(
                controller: _keypadController,
                height: 200,
              ),
              SizedBox(height: 50),
              Center(
                child: _actionButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  _actionButton() {
    return MainButton(
      title: widget.type == ActivityType.topUp ? 'Top up' : 'Next',
      onPressed: () {
        if (_keypadController.amount.value == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please enter how much'),
          ));
        } else {
          final activity = Get.find<ActivityModel>(tag: 'new_activity');
          activity.amount = _keypadController.amount.value;

          if (widget.type == ActivityType.pay) {
            Get.find<PageFragmentsController>().goNext();
          } else {
            activity.date = DateTime.now();

            Get.find<RecentActivityController>().addActivity(activity);
            Get.back();
          }
        }
      },
    );
  }
}
