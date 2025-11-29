import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/responsive_screens/testimonials_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/responsive_screens/testimonials_mobile.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/responsive_screens/testimonials_tablet.dart';

class CourseAllTestimonialsScreen extends StatelessWidget {
  const CourseAllTestimonialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CourseTestimonialsMobileScreen(),
      tablet: CourseTestimonialsTabletScreen(),
      desktop: CourseTestimonialsDesktopScreen(),
    );
  }
}
