import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';

class GetInTouchController extends GetxController {
  static GetInTouchController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <GetInTouchModel>[].obs;
  var filteredDataList = <GetInTouchModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() {
    dataList.addAll(List.generate(
      20,
      (i) => GetInTouchModel(
        id: i + 1,
        name: 'User ${i + 1}',
        email: 'user${i + 1}@example.com',
        phoneNumber: '+1-555-010${i.toString().padLeft(2, '0')}',
        subject: 'Subject ${i + 1}',
        message: 'This is a sample message number ${i + 1}.',
      ),
    ));
    filteredDataList.assignAll(dataList);
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
      dataList.where((e) =>
          e.name.toLowerCase().contains(q) ||
          e.email.toLowerCase().contains(q) ||
          e.subject.toLowerCase().contains(q)),
    );
  }

  void deleteItem(int id) {
    dataList.removeWhere((e) => e.id == id);
    filteredDataList.removeWhere((e) => e.id == id);
  }
}
