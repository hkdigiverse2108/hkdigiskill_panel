import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateGalleryController extends GetxController {
  final isLoading = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final galleryFormKey = GlobalKey<FormState>();

  final images = <String>[].obs;
  final controller = GalleryController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);

  final storageService = AdminStorageService();

  void onPickImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia(
      allowMultipleSelection: true,
    );

    if (selectedImages != null) {
      images.assignAll(selectedImages.map((e) => e.url).toList());
    }
  }

  void onRemoveImageAt(int index) {
    images.removeAt(index);
  }

  void createItem() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
        );
        return;
      }

      if (!galleryFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.galleryCreate,
        headers: {"authorization": storageService.token!},
        body: {
          "title": titleController.text,
          "description": descriptionController.text,
          "images": images,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        controller.fetchItems();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Gallery created successfully.",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
