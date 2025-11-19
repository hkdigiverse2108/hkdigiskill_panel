import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/controllers/all_partners_controller.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class AllPartnersTabletScreen extends StatelessWidget {
  const AllPartnersTabletScreen({super.key});

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
              heading: "Our Trusted Partners",
              breadcrumbsItems: ["Our Trusted Partners"],
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
                  // Table Header with Create Button (simplified for tablet)
                  AdminTableHeader(
                    buttonText: "Create Partner",
                    onPressed: () => Get.toNamed(AdminRoutes.createWorkshop),
                    searchController:
                        AllPartnersController.instance.searchController,
                    onSearchChanged: (query) {
                      AllPartnersController.instance.searchQuery(query);
                    },
                  ),

                  const Gap(AdminSizes.spaceBtwSections),

                  // Workshop Table (same as desktop but with adjusted columns)
                  const AllPartnersTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
