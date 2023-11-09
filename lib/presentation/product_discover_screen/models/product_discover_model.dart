// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'productdiscoverlist_item_model.dart';

/// This class defines the variables used in the [product_discover_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDiscoverModel extends Equatable {
  ProductDiscoverModel({this.productdiscoverlistItemList = const []}) {}

  List<ProductdiscoverlistItemModel> productdiscoverlistItemList;

  ProductDiscoverModel copyWith(
      {List<ProductdiscoverlistItemModel>? productdiscoverlistItemList}) {
    return ProductDiscoverModel(
      productdiscoverlistItemList:
          productdiscoverlistItemList ?? this.productdiscoverlistItemList,
    );
  }

  @override
  List<Object?> get props => [productdiscoverlistItemList];
}
