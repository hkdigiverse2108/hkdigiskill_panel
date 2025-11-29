import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:intl/intl.dart';

class WorkshopDataSource extends DataTableSource {
  final controller = WorkshopController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final workshop = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(workshop.title)),
        DataCell(Text(workshop.language)),
        DataCell(Text(workshop.duration)),
        DataCell(Text(workshop.price.toString())),
        DataCell(Text(workshop.mrpPrice.toString())),
        // Status & Actions
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            view: true,
            onEditPressed: () {
              Get.toNamed(AdminRoutes.editWorkshop, arguments: workshop);
            },
            onViewPressed: () {},
            onDeletePressed: () {
              // Show confirmation dialog before deleting
              ConfirmDialog.show(
                title: "Delete Workshop",
                message: "Are you sure you want to delete this workshop?",
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
