import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/controllers/edit_workshop_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';

class WorkshopTitleAndDescription extends StatelessWidget {
  const WorkshopTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditWorkshopController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.titleSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Basic Information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),

            // workshop title
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("title", value),
              decoration: const InputDecoration(labelText: "Workshop Title"),
              controller: controller.titleController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // workshop subtitle
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Workshop SubTitle (Optional)",
              ),
              controller: controller.subtitleController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // Description
            SizedBox(
              height: 200,
              child: TextFormField(
                controller: controller.descriptionController,
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: "Description (Optional)",
                  hintText: "Add Workshop Description here...",
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
