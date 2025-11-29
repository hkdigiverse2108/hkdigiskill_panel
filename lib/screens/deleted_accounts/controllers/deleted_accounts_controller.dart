import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/deleted_account_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class DeletedAccountsController extends GetxController {
  static DeletedAccountsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var isLoading = false.obs;

  var dataList = <DeletedAccount>[].obs;
  var filteredDataList = <DeletedAccount>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchDeletedAccounts();
  }

  void fetchDeletedAccounts() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.deletedAccounts,
        headers: {'Authorization': '${storageService.token}'},
        decoder: (json) {
          final data = json['data']['user_delete_data'] as List;
          return data.map((e) => DeletedAccount.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    // filteredDataList.sort((a, b) {
    //   int compareResult;
    //   switch (columnIndex) {
    //     case 0:
    //       compareResult = a.name.compareTo(b.name);
    //       break;
    //     case 1:
    //       compareResult = a.email.compareTo(b.email);
    //       break;
    //     case 2:
    //       compareResult = a.password.compareTo(b.password);
    //       break;
    //     case 3:
    //       compareResult = a.reason.compareTo(b.reason);
    //       break;
    //     case 4:
    //       compareResult = a.rate.compareTo(b.rate);
    //       break;
    //     default:
    //       compareResult = 0;
    //   }
    //
    //   return ascending ? compareResult : -compareResult;
    // });
  }

  void searchQuery(String query) {
    filteredDataList.value = dataList.where((element) {
      return element.userId.fullName.toLowerCase().contains(
            query.toLowerCase(),
          ) ||
          element.email.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void deleteAccount(String id) {
    dataList.removeWhere((element) => element.id == id);
    filteredDataList.removeWhere((element) => element.id == id);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
