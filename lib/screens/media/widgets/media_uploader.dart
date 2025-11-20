import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/folder_dropdown.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:universal_html/html.dart' as html;

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImagesUploaderSection.value
          ? Column(
              children: [
                /// Drag and drop area
                AdminRoundedContainer(
                  showBorder: true,
                  height: 250,
                  borderColor: AdminColors.borderPrimary,
                  backgroundColor: AdminColors.primaryBackground,
                  padding: EdgeInsets.all(AdminSizes.defaultSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DropzoneView(
                              mime: const ['image/jpeg', 'image/png'],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLoaded: () => log("Zone loaded"),
                              onError: (error) => log("Zone Error: $error"),
                              onHover: () => log("Zone Hovered"),
                              onLeave: () => log("Zone Left"),
                              onCreated: (ctrl) =>
                                  controller.dropzoneController = ctrl,

                              onDropFile: (file) async {
                                if (file is html.File) {
                                  final bytes = await controller
                                      .dropzoneController
                                      .getFileData(file);
                                  final image = ImageModel(
                                    url: '',
                                    filename: file.name,
                                    file: file,
                                    folder: '',
                                    localImageToDisplay: Uint8List.fromList(
                                      bytes,
                                    ),
                                  );
                                  controller.selectedImages.add(image);
                                }
                              },
                              onDropInvalid: (error) =>
                                  log("Invalid file: $error"),
                              onDropFiles: (files) {
                                log("Files dropped: ${files?.length}");
                              },
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AdminImages.uploadImage,
                                  height: 50,
                                  width: 50,
                                ),
                                const Gap(AdminSizes.spaceBtwItems),
                                const Text(
                                  "Drag and drop image here or click to upload",
                                ),
                                const Gap(AdminSizes.spaceBtwItems),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Select Image"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(AdminSizes.spaceBtwSections),

                /// Locally Selected images
                AdminRoundedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Folders Dropdown
                          Row(
                            children: [
                              Text(
                                "Select Folder",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Gap(AdminSizes.spaceBtwItems),
                              MediaFolderDropdown(
                                onChanged: (MediaCategory? newValue) {
                                  if (newValue != null) {
                                    controller.selectedCategory.value =
                                        newValue;
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text("Remove All"),
                              ),
                              const Gap(AdminSizes.spaceBtwItems),
                              AdminDeviceUtility.isMobileScreen(context)
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: AdminSizes.buttonWidth,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Upload"),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      Gap(AdminSizes.spaceBtwSections),
                      Wrap(
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
                      const Gap(AdminSizes.spaceBtwSections),
                      AdminDeviceUtility.isMobileScreen(context)
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Upload'),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                const Gap(AdminSizes.spaceBtwSections),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
