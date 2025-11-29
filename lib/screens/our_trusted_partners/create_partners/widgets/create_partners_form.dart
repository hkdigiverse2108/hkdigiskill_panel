import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/controllers/create_partners_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreatePartnersForm extends GetView<CreatePartnersController> {
  const CreatePartnersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        key: controller.createPartnersFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Gap(AdminSizes.sm),
            Text(
              "Add New Partner",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gap(AdminSizes.spaceBtwSections),
            TextFormField(
              controller: controller.partnerNameController,
              validator: (value) =>
                  AdminValidators.validateEmptyText("Name", value),
              decoration: InputDecoration(
                labelText: "Partner Name",
                prefixIcon: Icon(Iconsax.user),
              ),
            ),
            Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                labelText: "Partner Description",
                prefixIcon: Icon(Iconsax.document),
              ),
              maxLines: 3,
            ),
            Gap(AdminSizes.spaceBtwInputFields * 2),
            Obx(
              () => AdminImageUploader(
                width: 80,
                height: 80,
                image: controller.image.value,
                imageType: (controller.image.value.startsWith('http'))
                    ? ImageType.network
                    : ImageType.asset,
                onIconButtonPressed: () {
                  controller.selectCategoryImage();
                },
              ),
            ),
            Gap(AdminSizes.spaceBtwInputFields * 2),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.createPartners();
                        },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Create"),
                ),
              ),
            ),
            Gap(AdminSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
