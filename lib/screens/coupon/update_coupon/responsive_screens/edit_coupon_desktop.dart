import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/coupon_code_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/controllers/edit_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../widgets/basic_info.dart' show CouponBasicInfo;
import '../widgets/discount_&_amount.dart' show DiscountAndAmount;
import '../widgets/other.dart' show Other;

class EditCouponDesktopScreen extends GetView<EditCouponController> {
  const EditCouponDesktopScreen({super.key, required this.codeModel});

  final CouponCodeModel codeModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditCouponController(),
      initState: (state) {
        controller.initCouponData(codeModel);
      },
      builder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AdminSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    AdminBreadcrumbWithHeading(
                      returnToPreviousScreen: true,
                      breadcrumbsItems: [
                        AdminRoutes.couponCode,
                        'Create Coupon',
                      ],
                      heading: 'Create Coupon',
                    ),
                  ],
                ),
                const Gap(AdminSizes.spaceBtwSections),
                CouponBasicInfo(),
                Gap(AdminSizes.spaceBtwSections),
                DiscountAndAmount(),
                Gap(AdminSizes.spaceBtwSections),
                Other(codeModel: codeModel),
              ],
            ),
          ),
        );
      },
    );
  }
}
