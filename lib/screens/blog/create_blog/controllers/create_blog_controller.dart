import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class CreateBlogController extends GetxController {
  static CreateBlogController get instance => Get.find();

  var isLoading = false.obs;
  var isFeatured = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();

  final blogsController = BlogsController.instance;

  final createBlogFormKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var coverImagePath = ''.obs;
  var mainImagePath = ''.obs;
  var coverImageType = ImageType.asset.obs;
  var mainImageType = ImageType.asset.obs;

  Future<void> onCoverImageButtonPressed() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      coverImagePath.value = selectedImages.first.url;
      coverImageType.value = ImageType.network;
    }
  }

  Future<void> onMainImageButtonPressed() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      mainImagePath.value = selectedImages.first.url;
      mainImageType.value = ImageType.network;
    }
  }

  Future<void> createBlog() async {
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

      // Form validation
      if (!createBlogFormKey.currentState!.validate()) {
        return;
      }

      // Check if images are selected
      if (coverImagePath.isEmpty || mainImagePath.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Images Required",
          message: "Please select both cover and main images for the blog.",
        );
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.blogCreate,
        headers: {"authorization": storageService.token!},
        body: {
          "title": titleController.text,
          "subTitle": subTitleController.text,
          "content": contentController.text,
          "category": categoryController.text,
          "coverImage": coverImagePath.value,
          "mainImage": mainImagePath.value,
          "author": authorController.text,
          "isFeatured": isFeatured.value,
          "quote": quoteController.text.isNotEmpty
              ? quoteController.text
              : null,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        blogsController.fetchBlog();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Blog created successfully.",
        );
      } else {
        AdminLoaders.errorSnackBar(
          title: "Error",
          message:
              response['message'] ?? "Failed to create blog. Please try again.",
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

  @override
  void onClose() {
    titleController.dispose();
    subTitleController.dispose();
    contentController.dispose();
    categoryController.dispose();
    authorController.dispose();
    quoteController.dispose();
    super.onClose();
  }
}
