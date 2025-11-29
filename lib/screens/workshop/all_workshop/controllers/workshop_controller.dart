import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class WorkshopController extends GetxController {
  static WorkshopController get instance => Get.find();
  var isLoading = false.obs;

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <WorkshopModel>[].obs;
  var filteredDataList = <WorkshopModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchWorkshops();
  }

  void fetchWorkshops() async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
        path: ApiConstants.workshop,
        headers: {'Authorization': '${storageService.token}'},
        decoder: (json) {
          final data = json['data']['workshop_data'] as List;
          return data.map((e) => WorkshopModel.fromJson(e)).toList();
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
    //     case 0: // ID column
    //       compareResult = a.id.compareTo(b.id);
    //       break;
    //     case 1: // Name column
    //       compareResult = a.name.compareTo(b.name);
    //       break;
    //     case 2: // Instructor column
    //       compareResult = a.instructor.compareTo(b.instructor);
    //       break;
    //     case 3: // Start Date column
    //       compareResult = a.startDate.compareTo(b.startDate);
    //       break;
    //     case 4: // Participants column
    //       compareResult = a.currentParticipants.compareTo(
    //         b.currentParticipants,
    //       );
    //       break;
    //     default:
    //       return 0;
    //   }
    //   return ascending ? compareResult : -compareResult;
    // });
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (workshop) =>
            workshop.title.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  Future<void> deleteWorkshop(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        path: "${ApiConstants.workshopDelete}/$id",
        headers: {'Authorization': '${storageService.token}'},
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        fetchWorkshops();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: response['message'],
        );
      } else {
        AdminLoaders.errorSnackBar(
          title: "Error",
          message: response['message'],
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFeatured(int id) {
    // final index = dataList.indexWhere((workshop) => workshop.id == id);
    // if (index != -1) {
    //   final workshop = dataList[index];
    //   dataList[index] = workshop.copyWith(isFeatured: !workshop.isFeatured);
    //
    //   final filteredIndex = filteredDataList.indexWhere((w) => w.id == id);
    //   if (filteredIndex != -1) {
    //     filteredDataList[filteredIndex] = dataList[index];
    //   }
    // }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
