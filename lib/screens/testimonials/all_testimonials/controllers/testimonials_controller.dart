import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class TestimonialsController extends GetxController {
  static TestimonialsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var dataList = <TestimonialModel>[].obs;
  var filteredDataList = <TestimonialModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchTestimonials();
  }

  void fetchTestimonials() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.testimonials(DashType.home),
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          final data = json['data']['testimonial_data'] as List;
          return data
              .map<TestimonialModel>((e) => TestimonialModel.fromJson(e))
              .toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
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
          cmp = a.name.compareTo(b.name);
          break;
        case 1:
          cmp = a.designation.compareTo(b.designation);
          break;
        case 2:
          cmp = (a.rate).compareTo(b.rate);
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
            e.designation.toLowerCase().contains(q) ||
            (e.description ?? '').toLowerCase().contains(q),
      ),
    );
  }

  void deleteItem(String id) async {
    try {
      isLoading.value = true;

      final response = await apiService.delete(
        path: "${ApiConstants.testimonialsDelete}/$id",
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          return json as Map<String, dynamic>;
        },
      );

      if (response['status'] == 200) {
        fetchTestimonials();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Testimonial deleted successfully.",
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

  void toggleFeatured(int id) {
    /*final idx = dataList.indexWhere((e) => e.id == id);
    if (idx != -1) {
      final updated = dataList[idx].copyWith(
        isFeatured: !dataList[idx].isFeatured,
      );
      dataList[idx] = updated;
      final fidx = filteredDataList.indexWhere((e) => e.id == id);
      if (fidx != -1) filteredDataList[fidx] = updated;
    }*/
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
