import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/responsive_screens/edit_testimonial_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/responsive_screens/edit_testimonial_mobile.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/responsive_screens/edit_testimonial_tablet.dart';

class CourseEditTestimonialScreen extends StatelessWidget {
  const CourseEditTestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestimonialModel item = Get.arguments;
    return AdminSiteLayouts(
      mobile: CourseEditTestimonialMobileScreen(item: item),
      tablet: CourseEditTestimonialTabletScreen(item: item),
      desktop: CourseEditTestimonialDesktopScreen(item: item),
    );
  }
}
