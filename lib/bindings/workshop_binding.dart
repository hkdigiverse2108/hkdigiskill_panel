import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/controllers/create_workshop_controller.dart';

class WorkshopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkshopController>(() => WorkshopController());
    Get.lazyPut<CreateWorkshopController>(() => CreateWorkshopController());
  }
}
