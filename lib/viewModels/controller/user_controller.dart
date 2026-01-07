import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/data/domain/entities/user/user.dart';
import 'package:structure_mvvm/data/network/api_response.dart';
import 'package:structure_mvvm/data/repository/user/user_repo.dart';

class UserController extends GetxController {
  final UserRepo repo;
  UserController(this.repo);
  final CancelToken cancelToken = CancelToken();
  var users = <User>[].obs;
  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> loadUsers() async {
    isLoading.value = true;
    final ApiResponse<List<User>> result = await repo.fetchUsers(
      cancelToken: cancelToken,
    );
    if (result.success) {
      users.value = result.data ?? [];
      message.value = result.message ?? "Success";
    } else {
      message.value = result.error ?? "Unknown error";
    }
    isLoading.value = false;
  }

  @override
  void dispose() {
    cancelToken.cancel();
    super.dispose();
  }
}
