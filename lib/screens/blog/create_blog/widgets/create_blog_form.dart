import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/controllers/create_blog_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreateBlogForm extends GetView<CreateBlogController> {
  const CreateBlogForm({super.key});

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AdminSizes.tabletScreenSize;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AdminSizes.tabletScreenSize &&
      MediaQuery.of(context).size.width < AdminSizes.desktopScreenSize;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AdminSizes.desktopScreenSize;

  @override
  Widget build(BuildContext context) {
    final bool mobile = isMobile(context);
    final bool desktop = isDesktop(context);

    return AdminRoundedContainer(
      padding: const EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        key: controller.createBlogFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Create Blog Post',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AdminSizes.spaceBtwSections),

            // ==========================
            //   RESPONSIVE LAYOUT BODY
            // ==========================
            mobile ? _buildMobileLayout(context) : _buildWideLayout(context),

            const SizedBox(height: AdminSizes.spaceBtwSections),

            // ====================================
            //   FOOTER BUTTON (Right aligned)
            // ====================================
            Align(
              alignment: desktop ? Alignment.centerRight : Alignment.center,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.createBlog,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Create Blog'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  //                    MOBILE VIEW (COLUMN)
  // =========================================================
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

  // =========================================================
  //              TABLET / DESKTOP VIEW (ROW LAYOUT)
  // =========================================================
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------- LEFT: FORM FIELDS --------
        Expanded(flex: 2, child: _textFieldsSection()),

        const SizedBox(width: AdminSizes.spaceBtwSections),

        // -------- RIGHT: IMAGES SECTION --------
        Expanded(flex: 1, child: _imagesSection()),
      ],
    );
  }

  // =========================================================
  //            FORM FIELDS SECTION (REUSED)
  // =========================================================
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

        // Featured Checkbox
        Obx(
          () => CheckboxListTile(
            title: const Text('Featured Blog'),
            value: controller.isFeatured.value,
            onChanged: (value) {
              controller.isFeatured.value = value ?? false;
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }

  // =========================================================
  //                  IMAGES SECTION (RIGHT)
  // =========================================================
  Widget _imagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover Image
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

        // Main Image
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
