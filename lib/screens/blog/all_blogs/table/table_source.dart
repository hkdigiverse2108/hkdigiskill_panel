import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class BlogsDataSource extends DataTableSource {
  final controller = BlogsController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        // IMAGE
        DataCell(
          AdminRoundedImage(
            image: item.coverImage.isNotEmpty
                ? item.coverImage
                : AdminImages.defaultImage,
            width: 50,
            height: 50,
            imageType: item.coverImage.isEmpty
                ? ImageType.asset
                : ImageType.network,
            padding: AdminSizes.sm,
            borderRadius: AdminSizes.borderRadiusMd,
            backgroundColor: AdminColors.primaryBackground,
          ),
        ),

        // TITLE
        DataCell(
          Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),

        // AUTHOR
        DataCell(
          Text(item.author, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),

        // CATEGORY
        DataCell(
          Text(item.category, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),

        // FEATURED BADGE
        DataCell(
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: item.isFeatured
                    ? Colors.green.withOpacity(0.15)
                    : Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AdminSizes.borderRadiusMd),
                border: Border.all(
                  color: item.isFeatured ? Colors.green : Colors.grey,
                ),
              ),
              child: Text(
                item.isFeatured ? "Featured" : "Normal",
                style: TextStyle(
                  color: item.isFeatured ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),

        // CREATED AT
        DataCell(
          Text(
            AdminHelperFunctions.getFormattedDate(item.createdAt),
            // MMM dd, yyyy
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // ACTIONS
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.editBlog, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: 'Delete Blog',
                message: 'Are you sure you want to delete this blog?',
                iconColor: Colors.red,
                onConfirm: () => controller.deleteItem(item.id),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}
