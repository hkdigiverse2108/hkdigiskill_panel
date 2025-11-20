import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/faq/create_faq/responsive_screens/create_faq_desktop.dart';
import 'package:hkdigiskill_admin/screens/faq/create_faq/responsive_screens/create_faq_mobile.dart';
import 'package:hkdigiskill_admin/screens/faq/create_faq/responsive_screens/create_faq_tablet.dart';

class CreateFaqScreen extends StatelessWidget {
  const CreateFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateFaqMobileScreen(),
      tablet: CreateFaqTabletScreen(),
      desktop: CreateFaqDesktopScreen(),
    );
  }
}
