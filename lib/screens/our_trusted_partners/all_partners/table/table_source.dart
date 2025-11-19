import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/controllers/all_partners_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class AllPartnersDataSource extends DataTableSource {
  final controller = AllPartnersController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final workshop = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(
          AdminRoundedImage(
            imageType: ImageType.network,
            image: workshop.image,
            width: 50,
            height: 50,
            padding: AdminSizes.sm,
            borderRadius: AdminSizes.borderRadiusMd,
            backgroundColor: AdminColors.primaryBackground,
          ),
        ),
        DataCell(Text(workshop.name)),
        DataCell(Text(workshop.description)),

        // Status & Actions
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            // view: true,
            onEditPressed: () {},
            // onViewPressed: () {},
            onDeletePressed: () {
              // Show confirmation dialog before deleting
              ConfirmDialog.show(
                title: "Delete Partner",
                message: "Are you sure you want to delete this partner?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteWorkshop(workshop.id),
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
