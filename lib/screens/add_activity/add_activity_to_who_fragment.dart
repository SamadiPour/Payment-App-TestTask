import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_test_task/controllers/recent_activity_controller.dart';
import 'package:payment_app_test_task/models/activity_model.dart';
import 'package:payment_app_test_task/widgets/main_button.dart';

class AddActivityToWhoFragment extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: BouncingScrollPhysics(),
        addAutomaticKeepAlives: true,
        children: [
          SizedBox(height: 45),
          Center(
            child: Text(
              'To who?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 55),
          _textField(),
          SizedBox(height: 80),
          Center(
            child: MainButton(
              title: 'Pay',
              onPressed: () {
                final title = _textController.text;

                if (title.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter some text'),
                  ));
                } else {
                  final activity = Get.find<ActivityModel>(tag: 'new_activity');
                  activity.title = _textController.text;
                  activity.date = DateTime.now();

                  Get.find<RecentActivityController>().addActivity(activity);
                  Get.back();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _textField() {
    final _border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2,
      ),
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 275),
        child: TextFormField(
          maxLines: 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: _textController,
          decoration: InputDecoration(
            enabledBorder: _border,
            focusedBorder: _border,
            border: _border,
          ),
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
