import 'package:healthy_app/model/sub-activity/index.dart';

class ActivityListResponse {
  String message;
  List<Activity> items;

  ActivityListResponse({
    required this.message,
    required this.items
  });
}

class Activity {
  dynamic startTime;
  dynamic endTime;
  String activityId;
  String name;
  List<SubActivity> itemsSubActivity;
  bool isParent;
  bool isExpanded;
  String itemsActivityId;
  Activity({
    required this.endTime,
    required this.activityId,
    required this.startTime,
    required this.name,
    this.itemsActivityId = "",
    this.itemsSubActivity = const [],
    this.isExpanded = false,
    this.isParent = false,
  });

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> jsonList = itemsSubActivity.map((model) => model.toJson()).toList();
    return {
      "name": name,
      "endTime": endTime ,
      "startTime": startTime,
      "activityId": activityId,
      "isParent": true,
      "itemsSubActivity": jsonList
    };
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    
    List<SubActivity> resultsJson = [];
    if (json['itemsSubActivity'] != null) {
      var resultObject = json['itemsSubActivity'] as List;
      resultsJson = resultObject.map((dynamic tagJson) => SubActivity.fromJson(tagJson)).toList();
    }
    return Activity(
      itemsActivityId: json['itemsActivityId'] ?? "", 
      name: json['activityName'] ?? "", 
      endTime: json['endTime'] ?? "",
      startTime: json['startTime'] ?? "",
      activityId: json['activityId'] ?? "",
      isParent: json['isParent'] ?? false,
      itemsSubActivity: resultsJson
    );
  }
}

