import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/coupon_code_model.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/responsive_screens/edit_coupon_desktop.dart';

class EditCouponScreen extends StatelessWidget {
  const EditCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CouponCodeModel codeModel = Get.arguments;
    return AdminSiteLayouts(
      desktop: EditCouponDesktopScreen(codeModel: codeModel),
    );
  }
}
