import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/responsive_screens/edit_blog_desktop.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/responsive_screens/edit_blog_mobile.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/responsive_screens/edit_blog_tablet.dart';

class EditBlogScreen extends StatelessWidget {
  const EditBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogModel blog = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditBlogMobileScreen(blog: blog),
      tablet: EditBlogTabletScreen(blog: blog),
      desktop: EditBlogDesktopScreen(blog: blog),
    );
  }
}
