import 'package:structure_mvvm/data/models/user/user.dart';
import 'package:structure_mvvm/data/network/api_response.dart';
import 'package:structure_mvvm/data/network/network_api_service.dart';

class UserRepo {
  NetworkApiServices apiService = NetworkApiServices();

  Future<ApiResponse<List<User>>> fetchUsers() async {
    try {
      final response = await apiService.get(
        '/users',
        queryParameters: {"page": 1},
      );

      if (response == null) {
        return ApiResponse.error("No data found in response");
      }

      final List data = response['data'];
      final users = data.map((json) => User.fromJson(json)).toList();

      return ApiResponse.success(users, message: "Users fetched successfully");
    } catch (e) {
      return ApiResponse.error("Failed to fetch users: $e");
    }
  }
}
