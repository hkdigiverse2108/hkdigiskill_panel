import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/widgets/edit_get_in_touch_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditGetInTouchMobileScreen extends StatelessWidget {
  const EditGetInTouchMobileScreen({super.key, required this.item});

  final GetInTouchModel item;

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
              breadcrumbsItems: [AdminRoutes.getInTouch, 'Get In Touch'],
              heading: 'Edit Message',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            EditGetInTouchForm(item: item),
          ],
        ),
      ),
    );
  }
}
