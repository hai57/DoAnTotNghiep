import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/schedule/response.dart';
import 'package:healthy_app/model/sub-activity/index.dart';
import 'package:healthy_app/model/timer/index.dart';

class ScheduleApi {
  Future<ActivityListResponse> getListActivity() async {
    final response = await CoreApi.instance.get('/activities/get-all-activities');
    try {
      var resultObject = response.data['items'] as List;
      List<Activity> items = resultObject.map((dynamic tagJson) => Activity.fromJson(tagJson)).toList();
      return ActivityListResponse(
        message: response.data["message"],
        items: items
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  Future<TimerResponse> getTimer() async {
    final response = await CoreApi.instance.get('/time/getTime');
    try {
      var resultObject = response.data['times'] as List;
      List<Time> items = resultObject.map((dynamic tagJson) => Time.fromJson(tagJson)).toList();
      
      return TimerResponse(
        message: response.data["message"],
        timers: items
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  Future<String> createSchedule(data) async {
    final response = await CoreApi.instance.post('/schedule/create-schedule', data: data);
    try {
      return response.data["message"];
    } catch (error) {
      throw Exception('Post request failed: $error');
    }
  }

  Future<ListScheduleResponse> getSchedule() async {
    final response = await CoreApi.instance.get('/schedule/get-schedule');
    try {
      var resultObject = response.data['items'] as List;
      List<DayScheduleResponse> resultsJson = resultObject.map((dynamic tagJson) => DayScheduleResponse.fromJson(tagJson)).toList();
      return ListScheduleResponse(
        items: resultsJson,
        message: response.data['message']
      );
    } catch (error) {
      throw Exception('Post request failed: $error');
    }
  }

  Future<ScheduleResponse> getDetailSchedule(String id) async {
    final response = await CoreApi.instance.get('/schedule/get-detail-schedule/$id');
    try {
      Schedule newSchdule = Schedule.fromJson(response.data['schedule']);
      return ScheduleResponse(
        schedule: newSchdule,
        message: response.data['message']
      );
    } catch (error) {
      throw Exception('Post request failed: $error');
    }
  }

  Future<SubActivityResponse> getSubActivity(id) async {
    final response = await CoreApi.instance.get('/activities/get-subactivities-by-id-activity/$id');
    try {
      var resultObject = response.data['items'] as List;
      List<SubActivity> items = resultObject.map((dynamic tagJson) => SubActivity.fromJson(tagJson)).toList();
      return SubActivityResponse(
        message: response.data["message"],
        items: items
      );
    } catch (error) {
      throw Exception('Post request failed: $error');
    }
  }
}
