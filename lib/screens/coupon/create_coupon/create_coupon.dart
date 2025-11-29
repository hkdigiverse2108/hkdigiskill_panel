import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/responsive_screens/create_coupon_desktop.dart';

class CreateCoupon extends StatelessWidget {
  const CreateCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: CreateCouponDesktopScreen());
  }
}
