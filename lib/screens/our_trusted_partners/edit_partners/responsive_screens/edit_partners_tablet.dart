import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/partners_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/widgets/edit_partners_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditPartnersTabletScreen extends StatelessWidget {
  const EditPartnersTabletScreen({super.key, required this.partner});

  final PartnersModel partner;

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
            EditPartnersForm(partner),
          ],
        ),
      ),
    );
  }
}
