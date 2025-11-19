import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/partners_model.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class AllPartnersController extends GetxController {
  static AllPartnersController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <PartnersModel>[].obs;
  var filteredDataList = <PartnersModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchWorkshops();
  }

  void fetchWorkshops() {
    // TODO: Replace with actual API call
    dataList.addAll(
      List.generate(
        20,
        (index) => PartnersModel(
          id: index + 1,
          name: "Partner ${index + 1}",
          description: 'Partner Description ${index + 1}',
          image: AdminImages.profile,
        ),
      ),
    );

    filteredDataList.assignAll(dataList);
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

  void deleteWorkshop(int id) {
    // TODO: Implement delete functionality with API call
    dataList.removeWhere((partners) => partners.id == id);
    filteredDataList.removeWhere((partners) => partners.id == id);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
