import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/deleted_account_model.dart';

class DeletedAccountsController extends GetxController {
  static DeletedAccountsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <DeletedAccountModel>[].obs;
  var filteredDataList = <DeletedAccountModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDeletedAccounts();
  }

  void fetchDeletedAccounts() {
    dataList.addAll(
      List.generate(
        10,
        (index) => DeletedAccountModel(
          id: index.toString(),
          name: "User $index",
          email: "user$index@example.com",
          password: "password",
          reason: "Reason $index",
          rate: index,
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
        case 0:
          compareResult = a.name.compareTo(b.name);
          break;
        case 1:
          compareResult = a.email.compareTo(b.email);
          break;
        case 2:
          compareResult = a.password.compareTo(b.password);
          break;
        case 3:
          compareResult = a.reason.compareTo(b.reason);
          break;
        case 4:
          compareResult = a.rate.compareTo(b.rate);
          break;
        default:
          compareResult = 0;
      }

      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    filteredDataList.value = dataList.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
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
