import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/faq/edit_faq/controllers/edit_faq_controller.dart';

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController());
    Get.lazyPut<CreateFaqController>(() => CreateFaqController());
    Get.lazyPut<EditFaqController>(() => EditFaqController());
  }
}
