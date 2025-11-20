import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class GetInTouchTabletScreen extends StatelessWidget {
  const GetInTouchTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetInTouchController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              breadcrumbsItems: ['Get In Touch'],
              heading: 'Get In Touch',
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
                    isButtonVisible: false,
                    buttonText: 'Hidden',
                    searchController: controller.searchController,
                    onSearchChanged: (q) => controller.searchQuery(q),
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const GetInTouchTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
