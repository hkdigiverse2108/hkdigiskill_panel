import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/widgets/create_partners_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreatePartnersTabletScreen extends StatelessWidget {
  const CreatePartnersTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AdminBreadcrumbWithHeading(
                  returnToPreviousScreen: true,
                  breadcrumbsItems: [
                    AdminRoutes.trustedPartners,
                    "Add Partner",
                  ],
                  heading: "Add Partner",
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),

            // Form
            CreatePartnersForm(),
          ],
        ),
      ),
    );
  }
}
