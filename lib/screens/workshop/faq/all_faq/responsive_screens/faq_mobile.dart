import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class FaqMobileScreen extends StatelessWidget {
  const FaqMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FaqController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              breadcrumbsItems: ["FAQ"],
              heading: "FAQ",
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
                    buttonText: "Create FAQ",
                    onPressed: () => Get.toNamed(AdminRoutes.createFaq),
                    searchController: controller.searchController,
                    onSearchChanged: (query) {},
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const FaqTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
