import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_test_task/controllers/page_fragments_controller.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';
import 'package:payment_app_test_task/screens/add_activity/add_activity_money_fragment.dart';
import 'package:payment_app_test_task/screens/add_activity/add_activity_to_who_fragment.dart';
import 'package:payment_app_test_task/widgets/custom_app_bar.dart';

class AddActivityScreen extends StatefulWidget {
  final ActivityType type;

  const AddActivityScreen({Key? key, required this.type}) : super(key: key);

  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  late PageFragmentsController _controller;

  @override
  void initState() {
    super.initState();
    Get.put(
      ActivityModel.empty(widget.type),
      tag: 'new_activity',
    );
    _controller = Get.put(
      PageFragmentsController(
        [
          AddActivityMoneyFragment(type: widget.type),
          if (widget.type == ActivityType.pay) AddActivityToWhoFragment(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _controller.goBack();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: CustomAppBar(hasClose: true),
        backgroundColor: Theme.of(context).primaryColor,
        body: GetBuilder(
          init: _controller,
          builder: (_) {
            print(_controller.pageIndex);
            return PageTransitionSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  child: child,
                  fillColor: Theme.of(context).primaryColor,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                );
              },
              child: _controller.getCurrentChild(),
              reverse: _controller.reverse.value,
            );
          },
        ),
      ),
    );
  }
}
