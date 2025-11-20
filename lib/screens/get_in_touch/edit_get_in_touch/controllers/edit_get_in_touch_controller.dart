import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';

class EditGetInTouchController extends GetxController {
  var isLoading = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void initItem(GetInTouchModel item) {
    nameController.text = item.name;
    emailController.text = item.email;
    phoneController.text = item.phoneNumber;
    subjectController.text = item.subject;
    messageController.text = item.message;
  }

  void updateItem(GetInTouchModel item) {
    final list = GetInTouchController.instance;
    final updated = item.copyWith(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      subject: subjectController.text.trim(),
      message: messageController.text.trim(),
    );
    final idx = list.dataList.indexWhere((e) => e.id == item.id);
    if (idx != -1) list.dataList[idx] = updated;
    final fidx = list.filteredDataList.indexWhere((e) => e.id == item.id);
    if (fidx != -1) list.filteredDataList[fidx] = updated;
    Get.back();
  }
}
