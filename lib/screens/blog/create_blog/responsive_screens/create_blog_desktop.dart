import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/widgets/create_blog_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateBlogDesktopScreen extends StatelessWidget {
  const CreateBlogDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.blog, 'Create Blogs'],
              heading: 'Create Blog',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            const CreateBlogForm(),
          ],
        ),
      ),
    );
  }
}
