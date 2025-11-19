import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/controllers/deleted_accounts_controller.dart';

class DeletedAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeletedAccountsController>(() => DeletedAccountsController());
  }
}
