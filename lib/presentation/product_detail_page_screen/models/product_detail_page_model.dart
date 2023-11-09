// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'productcarousel_item_model.dart';

/// This class defines the variables used in the [product_detail_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDetailPageModel extends Equatable {
  ProductDetailPageModel({this.productcarouselItemList = const []}) {}

  List<ProductcarouselItemModel> productcarouselItemList;

  ProductDetailPageModel copyWith(
      {List<ProductcarouselItemModel>? productcarouselItemList}) {
    return ProductDetailPageModel(
      productcarouselItemList:
          productcarouselItemList ?? this.productcarouselItemList,
    );
  }

  @override
  List<Object?> get props => [productcarouselItemList];
}
