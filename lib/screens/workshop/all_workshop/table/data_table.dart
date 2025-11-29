import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class WorkshopTable extends StatelessWidget {
  const WorkshopTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkshopController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading...',
            animation: AdminImages.loadingAnimation,
            height: 200,
            width: 200,
          ),
        );
      }
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
        source: WorkshopDataSource(),
        columns: [
          const DataColumn2(label: Text("Title")),
          const DataColumn2(label: Text("Language")),
          const DataColumn2(label: Text("Duration")),
          const DataColumn2(label: Text("Price")),
          const DataColumn2(label: Text("MRP Price")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 140),
        ],
      );
    });
  }
}
