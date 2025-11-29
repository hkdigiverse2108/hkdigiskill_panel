import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/responsive_screens/edit_workshop_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/responsive_screens/edit_workshop_mobile.dart';

class EditWorkshopScreen extends StatelessWidget {
  const EditWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkshopModel workshop = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditWorkshopMobileScreen(workshop: workshop),
      desktop: EditWorkshopDesktopScreen(workshop: workshop),
    );
  }
}
