import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/screens/settings/widgets/basic_info.dart';
import 'package:hkdigiskill_admin/screens/settings/widgets/count_section.dart';
import 'package:hkdigiskill_admin/screens/settings/widgets/image_section.dart';
import 'package:hkdigiskill_admin/screens/settings/widgets/razorpay_section.dart';
import 'package:hkdigiskill_admin/screens/settings/widgets/social_links.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class SettingsMobileScreen extends StatelessWidget {
  const SettingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BreadCrumbs
              AdminBreadcrumbWithHeading(
                heading: "Settings",
                breadcrumbsItems: ['Settings'],
              ),
              Gap(AdminSizes.spaceBtwSections),

              // body
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSection(),
                    Gap(AdminSizes.spaceBtwSections),
                    BasicInfo(),
                    Gap(AdminSizes.spaceBtwSections),
                    RazorpaySection(),
                    Gap(AdminSizes.spaceBtwSections),
                    SocialLinks(),
                    Gap(AdminSizes.spaceBtwSections),
                    CountSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AdminRoundedContainer(
        radius: 0,
        padding: EdgeInsets.all(AdminSizes.md),
        child: Row(
          children: [
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.updateSettings,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Update Settings"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
