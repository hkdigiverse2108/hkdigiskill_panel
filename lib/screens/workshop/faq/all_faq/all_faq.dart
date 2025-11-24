import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/responsive_screens/faq_desktop.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/responsive_screens/faq_mobile.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/responsive_screens/faq_tablet.dart';

class AllFaqScreen extends StatelessWidget {
  const AllFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: FaqMobileScreen(),
      tablet: FaqTabletScreen(),
      desktop: FaqDesktopScreen(),
    );
  }
}
