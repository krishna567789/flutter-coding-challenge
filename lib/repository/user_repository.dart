import '../model/user_model.dart';
import '../core/network/api_service.dart';

class UserService {

  final ApiService _apiService = ApiService();
  static const String baseUrl = "https://dummyjson.com";
  Future<List<UserModel>> fetchUsers(int skip, {String? gender}) async {
    String url = "$baseUrl/users?limit=10&skip=$skip";
    if (gender != null) {
      url += "&key=gender&value=$gender";
    }
    final response = await _apiService.getApi(url);
    List users = response["users"];
    return users.map((e) => UserModel.fromJson(e)).toList();
  }
}