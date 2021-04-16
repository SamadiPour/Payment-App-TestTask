import 'package:enum_to_string/enum_to_string.dart';
import 'package:payment_app_test_task/models/activity_type_enum.dart';

class ActivityModel {
  DateTime date;
  String? title;
  double amount;
  ActivityType type;

  ActivityModel({
    required this.date,
    required this.amount,
    required this.type,
    this.title,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        title: json['title'],
        amount: json['amount'],
        date: DateTime.parse(json['date']),
        type: EnumToString.fromString(ActivityType.values, json['type'])!,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'amount': amount,
        'date': date.toString(),
        'type': EnumToString.convertToString(type),
      };
}
