import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/screens/faq/edit_faq/responsive_screens/edit_faq_desktop.dart';
import 'package:hkdigiskill_admin/screens/faq/edit_faq/responsive_screens/edit_faq_mobile.dart';
import 'package:hkdigiskill_admin/screens/faq/edit_faq/responsive_screens/edit_faq_tablet.dart';

class EditFaqScreen extends StatelessWidget {
  const EditFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FaqModel faq = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditFaqMobileScreen(faq: faq),
      tablet: EditFaqTabletScreen(faq: faq),
      desktop: EditFaqDesktopScreen(faq: faq),
    );
  }
}
