import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/partners_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/controllers/all_partners_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class EditPartnersController extends GetxController {
  var isLoading = false.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final editPartnersFormKey = GlobalKey<FormState>();

  TextEditingController partnerNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var image = AdminImages.defaultImage.obs;

  final partnerController = AllPartnersController.instance;

  void initPartner(PartnersModel partner) {
    partnerNameController.text = partner.name;
    descriptionController.text = partner.description ?? "";
    image.value = partner.image;
  }

  void selectCategoryImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      image.value = selectedImages.first.url;
    }
  }

  Future<void> updatePartners(PartnersModel partner) async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
          // message: "Something went wrong. Please try again.",
        );
        return;
      }

      if (!editPartnersFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.partnerUpdate,
        headers: {"authorization": storageService.token!},
        body: {
          "trustedPartnerId": partner.id,
          "name": partnerNameController.text,
          "description": descriptionController.text,
          "image": image.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        partnerController.fetchPartners();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Partners",
          message: "Partners updated successfully",
        );
      }
    } catch (e) {
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
