import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';

class FaqDataSource extends DataTableSource {
  final controller = FaqController.instance;

  @override
  DataRow? getRow(int index) {
    final faq = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(
          Text(
            faq.question,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(
          Text(
            faq.answer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(
          Switch(
            value: faq.isFeatured,
            onChanged: (_) => controller.toggleFeatured(faq.id),
          ),
        ),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () => Get.toNamed(AdminRoutes.editFaq, arguments: faq),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete FAQ",
                message: "Are you sure you want to delete this FAQ?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteFaq(faq.id),
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
