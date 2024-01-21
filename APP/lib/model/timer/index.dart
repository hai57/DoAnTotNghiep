class TimerResponse {
  String message;
  List<Time> timers;
  TimerResponse({
    required this.message,
    required this.timers
  });
}

class Time {
  String id;
  int hour;
  int minutes;
  Time({
    required this.id,
    required this.hour,
    required this.minutes,
  });
  
  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      id: json['id'],
      hour: json['hour'],
      minutes: json['minutes'],
    );
  }
}
