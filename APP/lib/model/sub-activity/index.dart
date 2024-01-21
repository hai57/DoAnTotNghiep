class SubActivity {
  String subActivityId;
  dynamic duration;
  String subActivityName;
  SubActivity({
    required this.subActivityId,
    required this.duration,
    required this.subActivityName
  });

  Map<String, dynamic> toJson(){
    return {
      "subActivityId": subActivityId ,
      "duration": duration,
    };
  }

  factory SubActivity.fromJson(Map<String, dynamic> json) {
    return SubActivity(
      subActivityId: json['subActivityId'] ?? "",
      duration: json['duration'] ?? "",
      subActivityName: json['subActivityName'] ?? ""
    );
  }
}

class SubActivityResponse {
  String message;
  List<SubActivity> items;
  SubActivityResponse({
    required this.message,
    required this.items
  });
}
