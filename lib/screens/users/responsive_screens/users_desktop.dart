import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/screens/users/controllers/users_controller.dart';
import 'package:hkdigiskill_admin/screens/users/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class UsersDesktopScreen extends StatelessWidget {
  const UsersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UsersController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminBreadcrumbWithHeading(
              heading: "Users",
              breadcrumbsItems: ["Users"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdminTableHeader(
                    buttonText: "Create User",
                    isButtonVisible: false,
                    searchController: controller.searchController,
                    onSearchChanged: (query) {
                      controller.searchQuery(query);
                    },
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const UsersTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
