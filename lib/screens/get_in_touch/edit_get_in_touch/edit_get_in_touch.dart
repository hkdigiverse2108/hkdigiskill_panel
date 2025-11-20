import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/responsive_screens/edit_get_in_touch_desktop.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/responsive_screens/edit_get_in_touch_mobile.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/responsive_screens/edit_get_in_touch_tablet.dart';

class EditGetInTouchScreen extends StatelessWidget {
  const EditGetInTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetInTouchModel item = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditGetInTouchMobileScreen(item: item),
      tablet: EditGetInTouchTabletScreen(item: item),
      desktop: EditGetInTouchDesktopScreen(item: item),
    );
  }
}
