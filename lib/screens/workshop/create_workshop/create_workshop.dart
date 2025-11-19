import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/responsive_screens/create_workshop_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/responsive_screens/create_workshop_mobile.dart';

class CreateWorkshopScreen extends StatelessWidget {
  const CreateWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateWorkshopMobileScreen(),
      desktop: CreateWorkshopDesktopScreen(),
    );
  }
}
