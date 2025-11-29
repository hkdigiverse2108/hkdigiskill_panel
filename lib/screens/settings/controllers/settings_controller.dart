import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/setting_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  var isLoading = false.obs;
  Rx<SettingModel> settings = SettingModel.empty().obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final linkController = TextEditingController();
  final facebookController = TextEditingController();
  final twitterController = TextEditingController();
  final instagramController = TextEditingController();
  final linkedinController = TextEditingController();
  final razorpayKeyController = TextEditingController();
  final razorpaySecretController = TextEditingController();
  final satisfactionRateController = TextEditingController();
  final enrolledLearnersController = TextEditingController();
  final classCompletedController = TextEditingController();
  var logo = 'https://avatar.iran.liara.run/public/26'.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);

  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchSettings();
  }

  void selectLogo() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      logo.value = selectedImages.first.url;
    }
  }

  Future<void> fetchSettings() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.settings,
        headers: {'authorization': '${storageService.token}'},
        decoder: (json) {
          final data = json['data'];
          return SettingModel.fromJson(data);
        },
      );

      settings.value = response;

      emailController.text = settings.value.email ?? "";
      phoneNumberController.text = settings.value.phoneNumber ?? "";
      addressController.text = settings.value.address ?? "";
      linkController.text = settings.value.link ?? "";
      facebookController.text = settings.value.socialMediaLinks!.facebook ?? "";
      twitterController.text = settings.value.socialMediaLinks!.twitter ?? "";
      instagramController.text =
          settings.value.socialMediaLinks!.instagram ?? "";
      linkedinController.text = settings.value.socialMediaLinks!.linkedin ?? "";
      razorpayKeyController.text = settings.value.razorpayKey ?? "";
      razorpaySecretController.text = settings.value.razorpaySecret ?? "";
      satisfactionRateController.text = settings.value.satisfactionRate == null
          ? ""
          : settings.value.satisfactionRate.toString();
      enrolledLearnersController.text = settings.value.enrolledLearners == null
          ? ""
          : settings.value.enrolledLearners.toString();
      classCompletedController.text = settings.value.classCompleted == null
          ? ""
          : settings.value.classCompleted.toString();
      logo.value = settings.value.logo;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateSettings() async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.settingsUpdate,
        headers: {'authorization': '${storageService.token}'},
        body: {
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text,
          'address': addressController.text,
          'link': linkController.text,
          "socialMediaLinks": {
            "facebook": facebookController.text,
            "twitter": twitterController.text,
            "instagram": instagramController.text,
            "linkedin": linkController.text,
          },
          'razorpayKey': razorpayKeyController.text,
          'razorpaySecret': razorpaySecretController.text,
          'satisfactionRate': satisfactionRateController.text,
          'enrolledLearners': enrolledLearnersController.text,
          'classCompleted': classCompletedController.text,
          'logo': logo.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        fetchSettings();
        AdminLoaders.successSnackBar(
          title: 'Success',
          message: 'Settings updated successfully',
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: 'Error',
        message: "Failed to get media images: $e",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
