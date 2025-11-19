import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/responsive_screens/all_partners_desktop.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/responsive_screens/all_partners_mobile.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/responsive_screens/all_partners_tablet.dart';

class AllPartners extends StatelessWidget {
  const AllPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: AllPartnersMobileScreen(),
      tablet: AllPartnersTabletScreen(),
      desktop: AllPartnersDesktopScreen(),
    );
  }
}
