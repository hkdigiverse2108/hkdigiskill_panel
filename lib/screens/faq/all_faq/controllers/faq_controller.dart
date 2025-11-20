import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';

class FaqController extends GetxController {
  static FaqController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <FaqModel>[].obs;
  var filteredDataList = <FaqModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  void fetchFaqs() {
    dataList.addAll(
      List.generate(
        20,
        (index) => FaqModel(
          id: index + 1,
          question: 'What is FAQ ${index + 1}?',
          answer: 'This is the answer for FAQ ${index + 1}.',
          isFeatured: index % 5 == 0,
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
          compareResult = a.question.compareTo(b.question);
          break;
        case 1:
          compareResult = a.answer.compareTo(b.answer);
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
        (faq) => faq.question.toLowerCase().contains(query.toLowerCase()) ||
            faq.answer.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  void deleteFaq(int id) {
    dataList.removeWhere((faq) => faq.id == id);
    filteredDataList.removeWhere((faq) => faq.id == id);
  }

  void toggleFeatured(int id) {
    final index = dataList.indexWhere((faq) => faq.id == id);
    if (index != -1) {
      final item = dataList[index];
      dataList[index] = item.copyWith(isFeatured: !item.isFeatured);
      final filteredIndex = filteredDataList.indexWhere((f) => f.id == id);
      if (filteredIndex != -1) {
        filteredDataList[filteredIndex] = dataList[index];
      }
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
