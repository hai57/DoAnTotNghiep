import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/model/user/index.dart';

class UserApi {
  Future<UserUpdateResponse> updateUser(data) async {
    final response = await CoreApi.instance.put('/user/update-usser', data: data);
    try {
      final User user = User.fromJson(response.data["user"]);
      return UserUpdateResponse(
        message: response.data["message"],
        user: user
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }
}
