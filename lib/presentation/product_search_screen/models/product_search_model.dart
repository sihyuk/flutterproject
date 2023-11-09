// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'productsearchlist_item_model.dart';

/// This class defines the variables used in the [product_search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductSearchModel extends Equatable {
  ProductSearchModel({this.productsearchlistItemList = const []}) {}

  List<ProductsearchlistItemModel> productsearchlistItemList;

  ProductSearchModel copyWith(
      {List<ProductsearchlistItemModel>? productsearchlistItemList}) {
    return ProductSearchModel(
      productsearchlistItemList:
          productsearchlistItemList ?? this.productsearchlistItemList,
    );
  }

  @override
  List<Object?> get props => [productsearchlistItemList];
}
