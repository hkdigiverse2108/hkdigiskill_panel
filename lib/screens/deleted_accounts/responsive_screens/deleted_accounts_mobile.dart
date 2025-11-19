import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/controllers/deleted_accounts_controller.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class DeletedAccountsMobileScreen extends StatelessWidget {
  const DeletedAccountsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb and Header
            const AdminBreadcrumbWithHeading(
              heading: "Deleted Accounts",
              breadcrumbsItems: ["Deleted Accounts"],
            ),

            const Gap(AdminSizes.spaceBtwSections),

            // Table Section
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table Header with Create Button
                  AdminTableHeader(
                    buttonText: "Create Workshop",
                    isButtonVisible: false,
                    searchController:
                        DeletedAccountsController.instance.searchController,
                    onSearchChanged: (query) {
                      DeletedAccountsController.instance.searchQuery(query);
                    },
                  ),

                  const Gap(AdminSizes.spaceBtwSections),

                  // Workshop Table
                  const AccountsTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
