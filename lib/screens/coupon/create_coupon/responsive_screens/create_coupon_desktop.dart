import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/widgets/basic_info.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/widgets/discount_&_amount.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/widgets/other.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateCouponDesktopScreen extends StatelessWidget {
  const CreateCouponDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  breadcrumbsItems: [AdminRoutes.couponCode, 'Create Coupon'],
                  heading: 'Create Coupon',
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            CouponBasicInfo(),
            Gap(AdminSizes.spaceBtwSections),
            DiscountAndAmount(),
            Gap(AdminSizes.spaceBtwSections),
            Other(),
          ],
        ),
      ),
    );
  }
}
