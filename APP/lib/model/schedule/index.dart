// ignore_for_file: unrelated_type_equality_checks

import 'package:healthy_app/model/activity/index.dart';

class Schedule {
  String nameSchedule;
  String type;
  List<DaySchedule> timeLine;
  String id;
  Schedule({
    this.id = "",
    required this.nameSchedule,
    required this.type,
    this.timeLine = const [],
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonList = timeLine.map((model) => model.toJson()).toList();

    return {
      'nameSchedule': nameSchedule,
      'type': type,
      'timeLine': jsonList
    };
  }
  factory Schedule.fromJson(Map<String, dynamic> json) {
    var resultObject = json['timeLine'] as List;
    List<DaySchedule> resultsJson = resultObject.map((dynamic tagJson) => DaySchedule.fromJson(tagJson)).toList();
    return Schedule(
      nameSchedule: json['nameSchedule'] ?? "", 
      type: json['type'] ?? "",
      timeLine: resultsJson,
      id: json['id'] ?? ""
    );
  }
}

class DaySchedule {
  List<Activity> itemsActivity;
  String idDaySchedule;
  DaySchedule({
    required this.itemsActivity,
    this.idDaySchedule = ""
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonList = itemsActivity.map((model) => model.toJson()).toList();
    return {
      'itemsActivity': jsonList,
    };
  }

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    var resultObject = json['itemsActivity'] as List;
    List<Activity> resultsJson = resultObject.map((dynamic tagJson) => Activity.fromJson(tagJson)).toList();
    return DaySchedule(
      itemsActivity: resultsJson,
      idDaySchedule: json['idDaySchedule'] ?? "",
    );
  }
}
