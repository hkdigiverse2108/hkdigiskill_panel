import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/users_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class UsersController extends GetxController {
  static UsersController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <UsersModel>[].obs;
  var filteredDataList = <UsersModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.users,
        decoder: (json) {
          final data = json['data']['user_data'] as List;
          return data.map<UsersModel>((e) => UsersModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);

      filteredDataList.assignAll(dataList);
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

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (user) =>
            user.fullName.toLowerCase().contains(query.toLowerCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase()) ||
            user.phoneNumber.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  void deleteUser(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        headers: {"authorization": storageService.token!},
        path: "${ApiConstants.usersDelete}/$id",
        decoder: (json) {},
      );
      AdminLoaders.successSnackBar(
        title: "User",
        message: "Deleted successfully",
      );
      fetchUsers();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
