import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;
    return AdminRoundedContainer(
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Social Media Links",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Gap(AdminSizes.spaceBtwItems),

          TextFormField(
            decoration: const InputDecoration(
              labelText: "Facebook",
              prefixIcon: Icon(Icons.facebook),
            ),

            controller: controller.facebookController,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Instagram",
              prefixIcon: Icon(Iconsax.instagram),
            ),

            controller: controller.instagramController,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Twitter",
              prefixIcon: Icon(Iconsax.activity),
            ),

            controller: controller.twitterController,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "linkedin",
              prefixIcon: Icon(Icons.link),
            ),

            controller: controller.linkedinController,
          ),
        ],
      ),
    );
  }
}
