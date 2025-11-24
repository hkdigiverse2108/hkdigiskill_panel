import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class GetInTouchController extends GetxController {
  static GetInTouchController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var dataList = <GetInTouchModel>[].obs;
  var filteredDataList = <GetInTouchModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.getInTouch,
        decoder: (json) {
          final data = json['data']['contact_messages_data'] as List;
          return data
              .map<GetInTouchModel>((e) => GetInTouchModel.fromJson(e))
              .toList();
        },
      );

      dataList.assignAll(response);

      filteredDataList.assignAll(dataList);
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

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int cmp = 0;
      switch (columnIndex) {
        case 0:
          cmp = a.name.compareTo(b.name);
          break;
        case 1:
          cmp = a.email.compareTo(b.email);
          break;
        case 2:
          cmp = a.phoneNumber.compareTo(b.phoneNumber);
          break;
        case 3:
          cmp = a.subject.compareTo(b.subject);
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
            e.name.toLowerCase().contains(q) ||
            e.email.toLowerCase().contains(q) ||
            e.subject.toLowerCase().contains(q),
      ),
    );
  }

  void deleteItem(String id) async {
    try {
      isLoading.value = true;

      final response = await apiService.delete(
        path: "${ApiConstants.getInTouchDelete}/$id",
        headers: {"token": storageService.token!},
        decoder: (json) {},
      );
      AdminLoaders.successSnackBar(
        title: "Get In Touch",
        message: "Deleted successfully",
      );
      fetchItems();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }
}
