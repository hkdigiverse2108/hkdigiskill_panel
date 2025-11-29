import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/coupon_code_model.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/controllers/edit_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class Other extends StatelessWidget {
  const Other({super.key, required this.codeModel});

  final CouponCodeModel codeModel;

  @override
  Widget build(BuildContext context) {
    final controller = EditCouponController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.otherSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: controller.appliesTo.value,
                    decoration: InputDecoration(
                      labelText: "Applies To",
                      prefixIcon: const Icon(Iconsax.activity),
                    ),
                    validator: (value) =>
                        AdminValidators.validateEmptyText("Applies To", value),
                    items: controller.appliesToList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      controller.discountType.value = value!;
                    },
                  ),
                ),
                const Gap(AdminSizes.spaceBtwInputFields),
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: controller.status.value,
                    decoration: InputDecoration(
                      labelText: "Status",
                      prefixIcon: const Icon(Iconsax.activity),
                    ),
                    items: controller.statusList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      controller.discountType.value = value!;
                    },
                  ),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.updateCoupon(codeModel);
                      },
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("Update Coupon"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
