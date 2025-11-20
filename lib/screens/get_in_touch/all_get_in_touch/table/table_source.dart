import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';

class GetInTouchDataSource extends DataTableSource {
  final controller = GetInTouchController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];
    return DataRow2(
      cells: [
        DataCell(Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(Text(item.email, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(Text(item.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(Text(item.subject, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(Text(item.message, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () => Get.toNamed(AdminRoutes.editGetInTouch, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: 'Delete Message',
                message: 'Are you sure you want to delete this message?',
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
