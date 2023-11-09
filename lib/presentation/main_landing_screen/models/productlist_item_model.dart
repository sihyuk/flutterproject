import '../../../core/app_export.dart';

/// This class is used in the [productlist_item_widget] screen.
class ProductlistItemModel {
  ProductlistItemModel({
    this.oliveplaindress,
    this.womenBlueSkinny,
    this.price,
    this.id,
  }) {
    oliveplaindress = oliveplaindress ?? ImageConstant.imgImage;
    womenBlueSkinny = womenBlueSkinny ?? "Olive plain dress";
    price = price ?? " 13.99";
    id = id ?? "";
  }

  String? oliveplaindress;

  String? womenBlueSkinny;

  String? price;

  String? id;
}
