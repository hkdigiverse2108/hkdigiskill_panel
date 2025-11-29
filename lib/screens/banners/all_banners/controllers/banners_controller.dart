import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  // SORTING
  final sortAscending = true.obs;
  final sortColumnIndex = 0.obs;

  // LOADER
  final isLoading = false.obs;

  // DATA LISTS
  final dataList = <BannerModel>[].obs;
  final filteredDataList = <BannerModel>[].obs;

  // SEARCH
  final searchController = TextEditingController();

  // SERVICES
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  late String token;

  @override
  void onInit() {
    super.onInit();
    token = storageService.token ?? "";
    fetchBanners();
  }

  // ---------------------------------------------------------------------------
  // FETCH API DATA
  // ---------------------------------------------------------------------------
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.banner, // 🔥 update later
        headers: {"Authorization": token},
        decoder: (json) {
          final data = json['data']['hero_banner_data'] as List;
          return data.map<BannerModel>((e) => BannerModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(dataList);
    } catch (e, s) {
      log("fetchBanners error: $e\n$s");
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ---------------------------------------------------------------------------
  // SORTING
  // ---------------------------------------------------------------------------
  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compare;

      switch (columnIndex) {
        case 0: // TYPE
          compare = a.type.index.compareTo(b.type.index);
          break;

        case 1: // TITLE / LINK
          final aKey = a.type == BannerType.web
              ? (a.title ?? "")
              : (a.link ?? "");
          final bKey = b.type == BannerType.web
              ? (b.title ?? "")
              : (b.link ?? "");
          compare = aKey.toLowerCase().compareTo(bKey.toLowerCase());
          break;

        // case 2: // CREATED DATE (optional)
        //   compare = (a.createdAt ?? DateTime(0))
        //       .compareTo(b.createdAt ?? DateTime(0));
        //   break;

        default:
          return 0;
      }

      return ascending ? compare : -compare;
    });
  }

  // ---------------------------------------------------------------------------
  // SEARCH
  // ---------------------------------------------------------------------------
  void searchQuery(String query) {
    final q = query.toLowerCase();

    filteredDataList.assignAll(
      dataList.where((item) {
        final key = item.type == BannerType.web
            ? (item.title ?? "")
            : (item.link ?? "");

        return key.toLowerCase().contains(q) ||
            (item.description ?? "").toLowerCase().contains(q);
      }),
    );
  }

  // ---------------------------------------------------------------------------
  // DELETE API
  // ---------------------------------------------------------------------------
  Future<void> deleteBanner(String id) async {
    try {
      final response = await apiService.delete(
        path: "${ApiConstants.bannerDelete}/$id", // 🔥 update later
        headers: {"Authorization": token},
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        fetchBanners();
        AdminLoaders.successSnackBar(
          title: "Banner",
          message: "Deleted successfully",
        );
      }

      fetchBanners();
    } catch (e) {
      log("deleteBanner error: $e");
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
