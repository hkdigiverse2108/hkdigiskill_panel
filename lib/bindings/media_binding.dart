import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaController>(() => MediaController());
  }
}
