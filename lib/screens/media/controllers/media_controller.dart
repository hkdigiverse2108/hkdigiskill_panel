import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;
  final RxBool showImagesUploaderSection = false.obs;
  final Rx<MediaCategory> selectedCategory = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImages = <ImageModel>[].obs;
}
