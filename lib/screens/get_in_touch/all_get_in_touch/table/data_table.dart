import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/controllers/get_in_touch_controller.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class GetInTouchTable extends StatelessWidget {
  const GetInTouchTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetInTouchController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1100,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: GetInTouchDataSource(),
        columns: [
          const DataColumn2(label: Text('Name')),
          DataColumn2(
            label: const Text('Email'),
            onSort: (i, asc) => controller.sort(i, asc),
          ),
          DataColumn2(
            label: const Text('Phone'),
            onSort: (i, asc) => controller.sort(i, asc),
          ),
          DataColumn2(
            label: const Text('Subject'),
            onSort: (i, asc) => controller.sort(i, asc),
          ),
          const DataColumn2(label: Text('Message'), size: ColumnSize.L),
          const DataColumn2(label: Text('Actions'), fixedWidth: 120),
        ],
      );
    });
  }
}
