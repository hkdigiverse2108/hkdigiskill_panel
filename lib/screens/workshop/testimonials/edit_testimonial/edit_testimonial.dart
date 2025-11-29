import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/responsive_screens/edit_testimonial_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/responsive_screens/edit_testimonial_mobile.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/responsive_screens/edit_testimonial_tablet.dart';

class WorkshopEditTestimonialScreen extends StatelessWidget {
  const WorkshopEditTestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestimonialModel item = Get.arguments;
    return AdminSiteLayouts(
      mobile: WorkshopEditTestimonialMobileScreen(item: item),
      tablet: WorkshopEditTestimonialTabletScreen(item: item),
      desktop: WorkshopEditTestimonialDesktopScreen(item: item),
    );
  }
}
