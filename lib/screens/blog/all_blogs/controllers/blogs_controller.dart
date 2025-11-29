import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class BlogsController extends GetxController {
  static BlogsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var dataList = <BlogModel>[].obs;
  var filteredDataList = <BlogModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchBlog();
  }

  void fetchBlog() async {
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

      final response = await apiService.get(
        path: ApiConstants.blog,
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          final data = json['data']['blog_data'] as List;
          return data.map<BlogModel>((e) => BlogModel.fromJson(e)).toList();
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

  void searchQuery(String query) {
    final q = query.toLowerCase();
    filteredDataList.assignAll(
      dataList.where((e) => e.title.toLowerCase().contains(q)),
    );
  }

  void deleteItem(String id) async {
    try {
      isLoading.value = true;

      final response = await apiService.delete(
        path: "${ApiConstants.blogDelete}/$id",
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          return json as Map<String, dynamic>;
        },
      );

      if (response['status'] == 200) {
        fetchBlog();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Blog deleted successfully.",
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
    searchController.dispose();
    super.onClose();
  }
}
