import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

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
            child: Text("Logo", style: Theme.of(context).textTheme.titleMedium),
          ),
          const Gap(AdminSizes.spaceBtwItems),
          Obx(
            () => AdminImageUploader(
              right: 10,
              bottom: 20,
              left: null,
              width: 200,
              height: 200,
              icon: Iconsax.camera,
              circular: true,
              onIconButtonPressed: controller.isLoading.value
                  ? null
                  : () {
                      controller.selectLogo();
                    },
              imageType: controller.logo.startsWith('http')
                  ? ImageType.network
                  : ImageType.asset,
              image: controller.logo.value,
            ),
          ),
        ],
      ),
    );
  }
}
