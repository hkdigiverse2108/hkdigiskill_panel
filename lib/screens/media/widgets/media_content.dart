import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/folder_dropdown.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return AdminRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Content Header
          Row(
            children: [
              Text(
                "Image Folders",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(AdminSizes.spaceBtwItems),
              MediaFolderDropdown(
                onChanged: (MediaCategory? newValue) {
                  if (newValue != null) {
                    controller.selectedCategory.value = newValue;
                  }
                },
              ),
            ],
          ),
          Gap(AdminSizes.spaceBtwSections),

          /// Media Content
          const Wrap(
            alignment: WrapAlignment.start,
            spacing: AdminSizes.spaceBtwItems / 2,
            runSpacing: AdminSizes.spaceBtwItems / 2,
            children: [
              AdminRoundedImage(
                imageType: ImageType.asset,
                height: 90,
                width: 90,
                padding: AdminSizes.sm,
                backgroundColor: AdminColors.primaryBackground,
                image: AdminImages.defaultImage,
                // memoryImage: element.localImageToDisplay,
              ),
              AdminRoundedImage(
                imageType: ImageType.asset,
                height: 90,
                width: 90,
                padding: AdminSizes.sm,
                backgroundColor: AdminColors.primaryBackground,
                image: AdminImages.defaultImage,
                // memoryImage: element.localImageToDisplay,
              ),
              AdminRoundedImage(
                imageType: ImageType.asset,
                height: 90,
                width: 90,
                padding: AdminSizes.sm,
                backgroundColor: AdminColors.primaryBackground,
                image: AdminImages.defaultImage,
                // memoryImage: element.localImageToDisplay,
              ),
            ],
          ),

          /// Load More Media Button
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AdminSizes.spaceBtwSections,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AdminSizes.buttonWidth * 1.2,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Load More'),
                    icon: const Icon(Iconsax.arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
