import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class RazorpaySection extends StatelessWidget {
  const RazorpaySection({super.key});

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
              "Razorpay Configuration",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Gap(AdminSizes.spaceBtwItems),

          TextFormField(
            decoration: const InputDecoration(
              labelText: "Razorpay Key",
              prefixIcon: Icon(Iconsax.key),
            ),
            obscureText: true,
            controller: controller.razorpayKeyController,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Razorpay Secret",
              prefixIcon: Icon(Iconsax.key),
            ),
            obscureText: true,
            controller: controller.razorpaySecretController,
          ),
        ],
      ),
    );
  }
}
