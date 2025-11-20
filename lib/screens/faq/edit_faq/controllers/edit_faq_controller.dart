import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';

class EditFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void initFaq(FaqModel faq) {
    questionController.text = faq.question;
    answerController.text = faq.answer;
    isFeatured.value = faq.isFeatured;
  }

  void updateFaq(FaqModel faq) {
    final faqController = FaqController.instance;
    final updated = faq.copyWith(
      question: questionController.text.trim(),
      answer: answerController.text.trim(),
      isFeatured: isFeatured.value,
    );

    final index = faqController.dataList.indexWhere((f) => f.id == faq.id);
    if (index != -1) {
      faqController.dataList[index] = updated;
    }
    final fIndex = faqController.filteredDataList.indexWhere((f) => f.id == faq.id);
    if (fIndex != -1) {
      faqController.filteredDataList[fIndex] = updated;
    }

    Get.back();
  }
}
