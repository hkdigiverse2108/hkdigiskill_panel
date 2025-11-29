import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/responsive_screens/create_testimonial_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/responsive_screens/create_testimonial_mobile.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/responsive_screens/create_testimonial_tablet.dart';

class CourseCreateTestimonialScreen extends StatelessWidget {
  const CourseCreateTestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CourseCreateTestimonialMobileScreen(),
      tablet: CourseCreateTestimonialTabletScreen(),
      desktop: CourseCreateTestimonialDesktopScreen(),
    );
  }
}
