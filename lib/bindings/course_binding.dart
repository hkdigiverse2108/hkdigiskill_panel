import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/controllers/edit_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/controllers/create_testimonial_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseFaqController>(() => CourseFaqController());
    Get.lazyPut<CourseCreateFaqController>(() => CourseCreateFaqController());
    Get.lazyPut<CourseEditFaqController>(() => CourseEditFaqController());
    Get.lazyPut<CourseTestimonialsController>(
      () => CourseTestimonialsController(),
    );
    Get.lazyPut<CourseCreateTestimonialController>(
      () => CourseCreateTestimonialController(),
    );
    Get.lazyPut<CourseEditTestimonialController>(
      () => CourseEditTestimonialController(),
    );
  }
}
