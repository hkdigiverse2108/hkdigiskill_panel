import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/settings/responsive_screens/settings_desktop.dart';
import 'package:hkdigiskill_admin/screens/settings/responsive_screens/settings_mobile.dart';
import 'package:hkdigiskill_admin/screens/settings/responsive_screens/settings_tablet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      mobile: SettingsMobileScreen(),
      tablet: SettingsTabletScreen(),
      desktop: SettingsDesktopScreen(),
    );
  }
}
