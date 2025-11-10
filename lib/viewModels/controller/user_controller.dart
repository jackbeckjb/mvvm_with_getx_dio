import 'package:get/get.dart';
import 'package:structure_mvvm/data/models/user/user.dart';
import 'package:structure_mvvm/data/network/api_response.dart';
import 'package:structure_mvvm/data/repository/user/user_repo.dart';

class UserController extends GetxController {
  final UserRepo _repo = UserRepo();
  var users = <User>[].obs;
  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> loadUsers() async {
    isLoading.value = true;
    final ApiResponse<List<User>> result = await _repo.fetchUsers();
    if (result.success) {
      users.value = result.data ?? [];
      message.value = result.message ?? "Success";
    } else {
      message.value = result.error ?? "Unknown error";
    }
    isLoading.value = false;
  }
}
