import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/coupon_code_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/controllers/all_coupons_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class EditCouponController extends GetxController {
  static EditCouponController get instance => Get.find();

  var isLoading = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController couponCodeController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController minAmountController = TextEditingController();
  TextEditingController maxDiscountAmountController = TextEditingController();
  TextEditingController maxUsageController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var discountType = 'Percentage'.obs;
  var discountTypeList = ['Percentage', 'Amount'].obs;
  var appliesTo = 'Default'.obs;
  var appliesToList = ['Default', 'Workshop', 'course'].obs;
  var status = 'Active'.obs;
  var statusList = ['Active', 'Inactive'].obs;

  final controller = AllCouponsController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final titleSectionForm = GlobalKey<FormState>();
  final discountSectionForm = GlobalKey<FormState>();
  final otherSectionForm = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void initCouponData(CouponCodeModel codeModel) {
    titleController.text = codeModel.title;
    couponCodeController.text = codeModel.code;
    discountController.text = codeModel.discountValue.toString();
    minAmountController.text = codeModel.minOrderAmount.toString();
    maxDiscountAmountController.text = codeModel.maxDiscountAmount.toString();
    maxUsageController.text = codeModel.usageLimit.toString();
    startDateController.text = codeModel.startDate == null
        ? ""
        : DateFormat('yyyy-MM-dd').format(codeModel.startDate!);
    endDateController.text = codeModel.endDate == null
        ? ""
        : DateFormat('yyyy-MM-dd').format(codeModel.endDate!);
    discountType.value = codeModel.discountType.name == 'percentage'
        ? 'Percentage'
        : 'Amount';
    appliesTo.value = codeModel.appliesTo == null
        ? 'Default'
        : codeModel.appliesTo!.capitalizeFirst!;
    status.value = codeModel.status == 'active' ? 'Active' : 'Inactive';
  }

  Future<String?> pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AdminColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date == null) return null;

    return DateFormat('yyyy-MM-dd').format(date);
  }

  void updateCoupon(CouponCodeModel codeModel) async {
    try {
      isLoading.value = true;
      if (!titleSectionForm.currentState!.validate() &&
          !discountSectionForm.currentState!.validate() &&
          !otherSectionForm.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.couponUpdate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          'couponCodeId': codeModel.id,
          'title': titleController.text,
          'code': couponCodeController.text,
          'discountValue': int.parse(discountController.text),
          'minOrderAmount': int.parse(minAmountController.text),
          'maxDiscountAmount': int.parse(maxDiscountAmountController.text),
          'usageLimit': int.parse(maxUsageController.text),
          'startDate': startDateController.text,
          'endDate': endDateController.text,
          'discountType': discountType.value.toLowerCase(),
          'appliesTo': appliesTo.value.toLowerCase(),
          'status': status.value.toLowerCase(),
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        controller.fetchCoupons();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Coupon updated successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
