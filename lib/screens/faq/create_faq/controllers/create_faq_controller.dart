import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';

class CreateFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void createFaq() {
    final faqController = FaqController.instance;
    final nextId = faqController.dataList.isEmpty
        ? 1
        : (faqController.dataList.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1);
    final faq = FaqModel(
      id: nextId,
      question: questionController.text.trim(),
      answer: answerController.text.trim(),
      isFeatured: isFeatured.value,
    );
    faqController.dataList.add(faq);
    faqController.filteredDataList.assignAll(faqController.dataList);
    Get.back();
  }
}
