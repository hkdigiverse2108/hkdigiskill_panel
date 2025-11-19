import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/controllers/all_partners_controller.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class AllPartnersTable extends StatelessWidget {
  const AllPartnersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AllPartnersController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 700,
        tableHeight: 700,
        dataRowHeight: AdminSizes.xl * 2.2,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: AllPartnersDataSource(),
        columns: [
          const DataColumn2(label: Text("Image")),
          DataColumn2(
            label: const Text("Partner Name"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
          ),
          DataColumn2(
            label: const Text("Description"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
            size: ColumnSize.L,
          ),
          const DataColumn2(label: Text("Actions"), fixedWidth: 100),
        ],
      );
    });
  }
}
