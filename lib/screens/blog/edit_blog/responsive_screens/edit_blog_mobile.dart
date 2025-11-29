import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/widgets/edit_blog_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditBlogMobileScreen extends StatelessWidget {
  const EditBlogMobileScreen({super.key, required this.blog});

  final BlogModel blog;

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
              breadcrumbsItems: [AdminRoutes.blog, 'Edit Blogs'],
              heading: 'Edit Blog',
            ),
            Gap(AdminSizes.spaceBtwSections),
            EditBlogForm(item: blog),
          ],
        ),
      ),
    );
  }
}
