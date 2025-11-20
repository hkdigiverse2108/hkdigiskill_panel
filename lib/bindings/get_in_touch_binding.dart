import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/controllers/edit_get_in_touch_controller.dart';

class GetInTouchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetInTouchController>(() => GetInTouchController());
    Get.lazyPut<EditGetInTouchController>(() => EditGetInTouchController());
  }
}
