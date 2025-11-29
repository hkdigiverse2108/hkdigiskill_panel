import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/partners_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class AllPartnersController extends GetxController {
  static AllPartnersController get instance => Get.find();
  var isLoading = false.obs;

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var dataList = <PartnersModel>[].obs;
  var filteredDataList = <PartnersModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchPartners();
  }

  void fetchPartners() async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
        path: ApiConstants.partner,
        headers: {"Authorization": storageService.token!},
        decoder: (json) {
          final data = json['data']['trusted_partner_data'] as List;
          final partnersList = data
              .map((json) => PartnersModel.fromJson(json))
              .toList();
          return partnersList;
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Get Partners error", message: "$e");
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
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (partners) => partners.name.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  void deletePartner(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        path: "${ApiConstants.partnerDelete}/$id",
        headers: {"Authorization": storageService.token!},
        decoder: (json) => json as Map<String, dynamic>,
      );
      if (response['status'] == 200) {
        fetchPartners();
        AdminLoaders.successSnackBar(
          title: "Partners",
          message: "Partners deleted successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Delete Partners error", message: "$e");
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
