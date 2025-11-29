import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/widgets/edit_testimonial_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseEditTestimonialDesktopScreen extends StatelessWidget {
  const CourseEditTestimonialDesktopScreen({super.key, required this.item});

  final TestimonialModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [
                AdminRoutes.cTestimonials,
                'Update Testimonials',
              ],
              heading: 'Update Testimonial',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            CourseEditTestimonialForm(item: item),
          ],
        ),
      ),
    );
  }
}
