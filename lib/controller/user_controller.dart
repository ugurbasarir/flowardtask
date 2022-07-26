import 'package:get/state_manager.dart';
import 'package:FlowardTask/model/user.dart';

import '../network/api.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = <User>[].obs;

  void getUserList() async {
    try {
      isLoading(true);
      var res = await Api.getUsers();
      if (res != null) {
        users.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }

}
