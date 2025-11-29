import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/screens/users/controllers/users_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class UserDataSource extends DataTableSource {
  final controller = UsersController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final user = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(user.fullName)),
        DataCell(Text(user.email)),
        DataCell(Text(user.phoneNumber)),
        DataCell(
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: user.isEmailVerified
                    ? Colors.green.withOpacity(0.15)
                    : Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AdminSizes.borderRadiusMd),
                border: Border.all(
                  color: user.isEmailVerified ? Colors.green : Colors.grey,
                ),
              ),
              child: Text(
                user.isEmailVerified ? "Verified" : "Not Verified",
                style: TextStyle(
                  color: user.isEmailVerified ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          AdminTableActionIconButtons(
            view: true,
            // edit: true,
            delete: true,
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Coupon",
                message: "Are you sure you want to delete this coupon?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteUser(user.id),
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
