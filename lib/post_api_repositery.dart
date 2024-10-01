import 'package:post_api/post_api_service.dart';

class PostApiRepository {
  static Future<bool> submitUserData(
      String username, String email, String gender) async {
    try {
      final result = await PostApiService.postUserData({
        'username': username,
        'Email': email,
        'gender': gender,
      });

      if (result) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in repository: $e');
      return false;
    }
  }
}
