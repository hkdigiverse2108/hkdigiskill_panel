import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class BlogsTabletScreen extends StatelessWidget {
  const BlogsTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlogsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              breadcrumbsItems: ['Blogs'],
              heading: 'Blogs',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdminTableHeader(
                    buttonText: 'Create Blog',
                    onPressed: () => Get.toNamed(AdminRoutes.createBlog),
                    searchController: controller.searchController,
                    onSearchChanged: (q) => controller.searchQuery(q),
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const BlogsTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
