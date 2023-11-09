import '../../../core/app_export.dart';

/// This class is used in the [productdiscoverlist_item_widget] screen.
class ProductdiscoverlistItemModel {
  ProductdiscoverlistItemModel({
    this.image,
    this.womenBlueSkinny,
    this.price,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImage3;
    womenBlueSkinny =
        womenBlueSkinny ?? "Women Blue Skinny Fit High-Rise Light Fade ";
    price = price ?? " 13.99";
    id = id ?? "";
  }

  String? image;

  String? womenBlueSkinny;

  String? price;

  String? id;
}
