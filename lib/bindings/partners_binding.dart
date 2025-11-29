import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/controllers/all_partners_controller.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/controllers/create_partners_controller.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/controllers/edit_partners_controller.dart';

class PartnersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPartnersController>(() => AllPartnersController());
    Get.lazyPut<CreatePartnersController>(() => CreatePartnersController());
    Get.lazyPut<EditPartnersController>(() => EditPartnersController());
  }
}
