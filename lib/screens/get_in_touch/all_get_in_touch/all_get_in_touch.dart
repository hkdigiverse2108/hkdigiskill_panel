import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/responsive_screens/get_in_touch_desktop.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/responsive_screens/get_in_touch_mobile.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/responsive_screens/get_in_touch_tablet.dart';

class AllGetInTouchScreen extends StatelessWidget {
  const AllGetInTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: GetInTouchMobileScreen(),
      tablet: GetInTouchTabletScreen(),
      desktop: GetInTouchDesktopScreen(),
    );
  }
}
