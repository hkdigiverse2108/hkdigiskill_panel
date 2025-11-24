import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class EditGetInTouchController extends GetxController {
  var isLoading = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  void initItem(GetInTouchModel item) {
    nameController.text = item.name;
    emailController.text = item.email;
    phoneController.text = item.phoneNumber;
    subjectController.text = item.subject;
    messageController.text = item.message ?? "";
  }

  void updateItem(GetInTouchModel item) async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.getInTouchUpdate,
        body: {
          "getInTouchId": item.id,
          "isRead": true,
          "name": nameController.text,
          "email": emailController.text,
          "phoneNumber": phoneController.text,
          "subject": subjectController.text,
          "message": messageController.text,
        },
        decoder: (json) {},
      );

      GetInTouchController.instance.fetchItems();

      Get.back();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
