import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/controllers/create_workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/pdf_selection.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/pricing_section.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/title_description.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/workshop_thumbnail_image.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

class CreateWorkshopDesktopScreen extends StatelessWidget {
  const CreateWorkshopDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateWorkshopController.instance;
    return Scaffold(
      // bottomNavigationBar: const WorkshopBottomNavigationButtons(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              heading: 'Create Workshop',
              breadcrumbsItems: [AdminRoutes.wWorkshops, 'Create Workshop'],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Information
                      const WorkshopTitleAndDescription(),
                      const Gap(AdminSizes.defaultSpace),

                      // Additional Information
                      Container(),
                    ],
                  ),
                ),
                Gap(AdminSizes.defaultSpace),
                Expanded(child: Column(children: [WorkshopThumbnailImage()])),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Information
                      const PricingSection(),
                      const Gap(AdminSizes.defaultSpace),

                      // Additional Information
                      Container(),
                    ],
                  ),
                ),
                Gap(AdminSizes.defaultSpace),
                Expanded(child: Column(children: [PdfSelection()])),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdminRoundedContainer(
        radius: 0,
        padding: EdgeInsets.all(AdminSizes.md),
        child: Row(
          children: [
            Expanded(flex: 4, child: SizedBox()),
            Gap(AdminSizes.spaceBtwItems),
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AdminColors.primary.withOpacity(0.4),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.clearField,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Clear"),
                ),
              ),
            ),
            Gap(AdminSizes.spaceBtwItems),
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.createWorkshop,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Create Workshop"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
