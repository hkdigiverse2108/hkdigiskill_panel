import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/users/responsive_screens/users_desktop.dart';
import 'package:hkdigiskill_admin/screens/users/responsive_screens/users_mobile.dart';
import 'package:hkdigiskill_admin/screens/users/responsive_screens/users_tablet.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      mobile: UsersMobileScreen(),
      tablet: UsersTabletScreen(),
      desktop: UsersDesktopScreen(),
    );
  }
}
