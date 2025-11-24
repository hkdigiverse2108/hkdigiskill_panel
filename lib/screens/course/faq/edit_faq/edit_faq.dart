import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/responsive_screens/edit_faq_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/responsive_screens/edit_faq_mobile.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/responsive_screens/edit_faq_tablet.dart';

class CourseEditFaqScreen extends StatelessWidget {
  const CourseEditFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FaqModel faq = Get.arguments;
    return AdminSiteLayouts(
      mobile: CourseEditFaqMobileScreen(faq: faq),
      tablet: CourseEditFaqTabletScreen(faq: faq),
      desktop: CourseEditFaqDesktopScreen(faq: faq),
    );
  }
}
