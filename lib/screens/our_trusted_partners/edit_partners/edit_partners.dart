import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/responsive_screens/edit_partners_desktop.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/responsive_screens/edit_partners_mobile.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/responsive_screens/edit_partners_tablet.dart';

class EditPartners extends StatelessWidget {
  const EditPartners({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = Get.arguments;
    return AdminSiteLayouts(
      desktop: EditPartnersDesktopScreen(partner: partner),
      tablet: EditPartnersTabletScreen(partner: partner),
      mobile: EditPartnersMobileScreen(partner: partner),
    );
  }
}
