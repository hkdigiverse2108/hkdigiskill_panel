import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/controllers/edit_blog_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class EditBlogForm extends GetView<EditBlogController> {
  const EditBlogForm({super.key, required this.item});

  final BlogModel item;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AdminSizes.tabletScreenSize;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AdminSizes.desktopScreenSize;

  @override
  Widget build(BuildContext context) {
    final bool mobile = isMobile(context);
    final bool desktop = isDesktop(context);

    return GetBuilder<EditBlogController>(
      init: EditBlogController(),
      initState: (_) => controller.initBlog(item),
      builder: (controller) {
        return AdminRoundedContainer(
          padding: const EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            key: controller.editBlogFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Edit Blog Post',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AdminSizes.spaceBtwSections),

                // ==========================
                //   RESPONSIVE BODY
                // ==========================
                mobile
                    ? _buildMobileLayout(context)
                    : _buildWideLayout(context),

                const SizedBox(height: AdminSizes.spaceBtwSections),

                // FOOTER BUTTONS
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.updateBlog,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Update Blog'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // MOBILE LAYOUT
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textFieldsSection(),
        const SizedBox(height: AdminSizes.spaceBtwSections),
        _imagesSection(),
      ],
    );
  }

  // DESKTOP/TABLET LAYOUT
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _textFieldsSection()),
        const SizedBox(width: AdminSizes.spaceBtwSections),
        Expanded(flex: 1, child: _imagesSection()),
      ],
    );
  }

  // LEFT FIELDS
  Widget _textFieldsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        TextFormField(
          controller: controller.titleController,
          validator: (v) => AdminValidators.validateEmptyText('Title', v),
          decoration: const InputDecoration(
            labelText: 'Title',
            prefixIcon: Icon(Iconsax.text),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwInputFields),

        // Subtitle
        TextFormField(
          controller: controller.subTitleController,
          decoration: const InputDecoration(
            labelText: 'Subtitle (optional)',
            prefixIcon: Icon(Iconsax.text_block),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwInputFields),

        // Category
        TextFormField(
          controller: controller.categoryController,
          validator: (v) => AdminValidators.validateEmptyText('Category', v),
          decoration: const InputDecoration(
            labelText: 'Category',
            prefixIcon: Icon(Iconsax.category),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwInputFields),

        // Author
        TextFormField(
          controller: controller.authorController,
          validator: (v) => AdminValidators.validateEmptyText('Author', v),
          decoration: const InputDecoration(
            labelText: 'Author',
            prefixIcon: Icon(Iconsax.user),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwInputFields),

        // Quote
        TextFormField(
          controller: controller.quoteController,
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Quote (optional)',
            prefixIcon: Icon(Iconsax.quote_down),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwInputFields),

        // Content
        TextFormField(
          controller: controller.contentController,
          validator: (v) => AdminValidators.validateEmptyText('Content', v),
          maxLines: 10,
          decoration: const InputDecoration(
            labelText: 'Content',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwSections),

        // Featured
        Obx(
          () => CheckboxListTile(
            title: const Text('Featured Blog'),
            value: controller.isFeatured.value,
            onChanged: (value) => controller.isFeatured.value = value ?? false,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }

  // RIGHT IMAGES
  Widget _imagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cover Image',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AdminSizes.sm),
        Obx(
          () => AdminImageUploader(
            width: double.infinity,
            height: 200,
            image: controller.coverImagePath.value.isEmpty
                ? AdminImages.defaultImage
                : controller.coverImagePath.value,
            imageType: controller.coverImagePath.value.isEmpty
                ? ImageType.asset
                : controller.coverImageType.value,
            onIconButtonPressed: controller.onCoverImageButtonPressed,
          ),
        ),
        const SizedBox(height: AdminSizes.spaceBtwItems),

        const Text('Main Image', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AdminSizes.sm),
        Obx(
          () => AdminImageUploader(
            width: double.infinity,
            height: 300,
            image: controller.mainImagePath.value.isEmpty
                ? AdminImages.defaultImage
                : controller.mainImagePath.value,
            imageType: controller.mainImagePath.value.isEmpty
                ? ImageType.asset
                : controller.mainImageType.value,
            onIconButtonPressed: controller.onMainImageButtonPressed,
          ),
        ),
      ],
    );
  }
}
