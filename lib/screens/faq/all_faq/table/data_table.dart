import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class FaqTable extends StatelessWidget {
  const FaqTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FaqController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1000,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: FaqDataSource(),
        columns: [
          const DataColumn2(label: Text("Question")),
          DataColumn2(
            label: const Text("Answer"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
            size: ColumnSize.L,
          ),
          const DataColumn2(label: Text("Featured")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
