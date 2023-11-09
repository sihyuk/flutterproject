import '../../../core/app_export.dart';

/// This class is used in the [profilemyorders_item_widget] screen.
class ProfilemyordersItemModel {
  ProfilemyordersItemModel({
    this.image,
    this.price,
    this.shortsInYellow,
    this.one,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImage110x109;
    price = price ?? "12.50";
    shortsInYellow = shortsInYellow ?? "shorts in Yellow";
    one = one ?? "1";
    id = id ?? "";
  }

  String? image;

  String? price;

  String? shortsInYellow;

  String? one;

  String? id;
}
