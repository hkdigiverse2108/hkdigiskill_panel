import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/controllers/deleted_accounts_controller.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class AccountsTable extends StatelessWidget {
  const AccountsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DeletedAccountsController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1200,
        tableHeight: 700,
        dataRowHeight: AdminSizes.xl * 2.2,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: AccountsDataSource(),
        columns: [
          const DataColumn2(label: Text("User Name")),
          DataColumn2(
            label: const Text("Email"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
          ),
          DataColumn2(
            label: const Text("Password"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
            size: ColumnSize.L,
          ),
          const DataColumn2(label: Text("Reason")),
          const DataColumn2(label: Text("Rate")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 140),
        ],
      );
    });
  }
}
