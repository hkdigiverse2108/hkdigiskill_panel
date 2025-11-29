import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/users/controllers/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
