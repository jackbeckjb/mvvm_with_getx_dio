import 'package:dio/dio.dart';
import 'package:structure_mvvm/data/domain/dtos/user/user_dto.dart';
import 'package:structure_mvvm/data/domain/entities/user/user.dart';
import 'package:structure_mvvm/data/domain/mappers/user_mapper.dart';
import 'package:structure_mvvm/data/network/api_response.dart';
import 'package:structure_mvvm/data/network/network_api_service.dart';

class UserRepo {
  NetworkApiServices apiService;
  UserRepo(this.apiService);

  Future<ApiResponse<List<User>>> fetchUsers({CancelToken? cancelToken}) async {
    try {
      final response = await apiService.get(
        '/data',
        cancelToken: cancelToken,
        // queryParameters: {"page": 1},
      );

      if (response == null) {
        return ApiResponse.error("No data found in response");
      }

      final List data = response['data'];
      final users = data
          .map((json) => UserMapper.formUserDto(UserDto.fromJson(json)))
          .toList(); // HERE IS WE CALL MAPPER TO CONVERT THE DTO INTO OUR CANONICAL MODEL

      return ApiResponse.success(users, message: "Users fetched successfully");
    } catch (e) {
      return ApiResponse.error("Failed to fetch users: $e");
    }
  }
}
