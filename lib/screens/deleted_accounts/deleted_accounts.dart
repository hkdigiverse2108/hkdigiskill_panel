import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/responsive_screens/deleted_accounts_desktop.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/responsive_screens/deleted_accounts_mobile.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/responsive_screens/deleted_accounts_tablet.dart';

class DeletedAccountsScreen extends StatelessWidget {
  const DeletedAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: DeletedAccountsMobileScreen(),
      tablet: DeletedAccountsTabletScreen(),
      desktop: DeletedAccountsDesktopScreen(),
    );
  }
}
