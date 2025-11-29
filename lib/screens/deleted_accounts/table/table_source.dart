import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/controllers/deleted_accounts_controller.dart';
import 'package:intl/intl.dart';

class AccountsDataSource extends DataTableSource {
  final controller = DeletedAccountsController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final account = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(account.userId.fullName)),
        DataCell(Text(account.email)),
        DataCell(Text(account.reason)),
        DataCell(Text(account.rate.toString())),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            view: true,
            onEditPressed: () {},
            onViewPressed: () {},
            // onDeletePressed: () {
            //   // Show confirmation dialog before deleting
            //   ConfirmDialog.show(
            //     title: "Delete Workshop",
            //     message: "Are you sure you want to delete this workshop?",
            //     iconColor: Colors.red,
            //     onConfirm: () => controller.deleteAccount(account.id),
            //   );
            // },
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
