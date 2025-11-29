import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/responsive_screens/create_blog_desktop.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/responsive_screens/create_blog_mobile.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/responsive_screens/create_blog_tablet.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateBlogMobileScreen(),
      tablet: CreateBlogTabletScreen(),
      desktop: CreateBlogDesktopScreen(),
    );
  }
}