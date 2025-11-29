import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <CourseCategoryDatum>[].obs;
  var filteredDataList = <CourseCategoryDatum>[].obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);

  final storageService = AdminStorageService();

  // RxList<bool> selectedRows = <bool>[].obs;
  final searchController = TextEditingController();
  var token = "";

  @override
  void onInit() {
    super.onInit();
    token = storageService.token!;
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": token},
        path: ApiConstants.category,
        decoder: (json) => CategoryModel.fromJson(json),
      );

      dataList.assignAll(response.data!.courseCategoryData ?? []);

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
      int compareResult;
      switch (columnIndex) {
        case 0: // ID column
          compareResult = a.id.compareTo(b.id);
          break;
        case 1: // Name column
          compareResult = a.name.compareTo(b.name);
          break;
        // Add more cases for other sortable columns
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void deleteCategory(String id) async {
    try {
      final response = await apiService.delete(
        path: "${ApiConstants.categoryDelete}/$id",
        headers: {"Authorization": storageService.token!},
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        fetchCategories();
        AdminLoaders.successSnackBar(
          title: "Category",
          message: "Deleted successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where((element) => element.name.contains(query.toLowerCase())),
    );
  }
}
