import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class GalleryController extends GetxController {
  static GalleryController get instance => Get.find();

  final sortAscending = true.obs;
  final sortColumnIndex = 0.obs;

  final isLoading = false.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final dataList = <GalleryModel>[].obs;
  final filteredDataList = <GalleryModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
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

      final response = await apiService.get(
        path: ApiConstants.gallery,
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          final data = json['data']['gallery_data'] as List;
          return data.map((e) => GalleryModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(dataList);
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

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int cmp;
      switch (columnIndex) {
        case 0:
          cmp = a.title.toLowerCase().compareTo(b.title.toLowerCase());
          break;
        case 1:
          cmp = a.images.length.compareTo(b.images.length);
          break;
        default:
          return 0;
      }
      return ascending ? cmp : -cmp;
    });
  }

  void searchQuery(String query) {
    final q = query.toLowerCase();
    filteredDataList.assignAll(
      dataList.where(
        (e) =>
            e.title.toLowerCase().contains(q) ||
            (e.description ?? '').toLowerCase().contains(q),
      ),
    );
  }

  void deleteItem(String id) async {
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

      final response = await apiService.delete(
        path: "${ApiConstants.galleryDelete}/$id",
        headers: {"authorization": storageService.token!},
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Gallery deleted successfully.",
        );
        fetchItems();
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Delete Failed",
        message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
