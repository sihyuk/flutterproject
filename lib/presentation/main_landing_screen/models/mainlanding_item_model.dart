import '../../../core/app_export.dart';

/// This class is used in the [mainlanding_item_widget] screen.
class MainlandingItemModel {
  MainlandingItemModel({
    this.image,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImage15;
    id = id ?? "";
  }

  String? image;

  String? id;
}
