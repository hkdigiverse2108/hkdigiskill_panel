import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/responsive_screens/create_partners_desktop.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/responsive_screens/create_partners_mobile.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/responsive_screens/create_partners_tablet.dart';

class CreatePartners extends StatelessWidget {
  const CreatePartners({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      mobile: CreatePartnersMobileScreen(),
      tablet: CreatePartnersTabletScreen(),
      desktop: CreatePartnersDesktopScreen(),
    );
  }
}
