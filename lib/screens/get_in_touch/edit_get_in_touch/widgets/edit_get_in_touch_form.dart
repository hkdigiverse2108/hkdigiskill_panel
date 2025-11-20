import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/get_in_touch_model.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/controllers/edit_get_in_touch_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class EditGetInTouchForm extends GetView<EditGetInTouchController> {
  const EditGetInTouchForm({super.key, required this.item});

  final GetInTouchModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditGetInTouchController(),
      initState: (state) {
        controller.initItem(item);
      },
      builder: (controller) {
        return AdminRoundedContainer(
          width: 700,
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Message',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AdminSizes.spaceBtwSections),
                TextFormField(
                  controller: controller.nameController,
                  validator: (v) => AdminValidators.validateEmptyText('Name', v),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.emailController,
                  validator: (v) => AdminValidators.emailValidator(v),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneController,
                  validator: (v) =>
                      AdminValidators.validateEmptyText('Phone Number', v),
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Iconsax.call),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.subjectController,
                  validator: (v) => AdminValidators.validateEmptyText('Subject', v),
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    prefixIcon: Icon(Iconsax.document),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.messageController,
                  validator: (v) => AdminValidators.validateEmptyText('Message', v),
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    prefixIcon: Icon(Iconsax.message_text),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.updateItem(item),
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
