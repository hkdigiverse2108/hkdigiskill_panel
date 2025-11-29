import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/controllers/edit_workshop_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditWorkshopController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.pricingSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Pricing & Other Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),

            // price
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("Price", value),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price (₹)",
                hintText: "1000",
              ),
              controller: controller.priceController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) =>
                  AdminValidators.validateEmptyText("MRP Price", value),
              decoration: const InputDecoration(labelText: "MRP Price (₹)"),
              controller: controller.mrpPriceController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("Language", value),
              decoration: const InputDecoration(
                labelText: "Language",
                hintText: "English",
              ),
              controller: controller.languageController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Duration",
                hintText: "4 hours",
              ),
              controller: controller.durationController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Valid For",
                hintText: "30 days / 1 year",
              ),
              controller: controller.validForController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // workshop subtitle
            TextFormField(
              decoration: const InputDecoration(
                labelText: "couponCode (Optional)",
              ),
              controller: controller.couponController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
