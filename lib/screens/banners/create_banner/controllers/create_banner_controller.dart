import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/controllers/banners_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateBannerController extends GetxController {
  final isLoading = false.obs;
  final type = BannerType.web.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  final bController = BannersController.instance;

  final createBannerFormKey = GlobalKey<FormState>();

  // SERVICES
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final imagePrimary = ''.obs;
  final imageSecondary = ''.obs;

  void onPickPrimary() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      imagePrimary.value = selectedImages.first.url;
    }
  }

  void onPickSecondary() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      imageSecondary.value = selectedImages.first.url;
    }
  }

  void createItem() async {
    try {
      isLoading.value = true;

      var body = {};

      if (type.value == BannerType.web) {
        body = {
          "type": type.value.name,
          "title": titleController.text.trim(),
          "description": descriptionController.text.trim(),
          "images": [imagePrimary.value, imageSecondary.value],
        };
      } else {
        body = {
          "type": type.value.name,
          "link": linkController.text.trim(),
          "images": [imagePrimary.value],
        };
      }

      final res = await apiService.post(
        path: ApiConstants.bannerCreate,
        headers: {"Authorization": storageService.token!},
        body: body,
        decoder: (json) {
          return json as Map<String, dynamic>;
        },
      );

      if (res['status'] == 200) {
        bController.fetchBanners();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Banner",
          message: "Created successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Banner",
        message: "Failed to create banner",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
