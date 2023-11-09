// ignore_for_file: must_be_immutable

part of 'product_detail_page_bloc.dart';

/// Represents the state of ProductDetailPage in the application.
class ProductDetailPageState extends Equatable {
  ProductDetailPageState({
    this.sliderIndex = 0,
    this.productDetailPageModelObj,
  });

  ProductDetailPageModel? productDetailPageModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        productDetailPageModelObj,
      ];
  ProductDetailPageState copyWith({
    int? sliderIndex,
    ProductDetailPageModel? productDetailPageModelObj,
  }) {
    return ProductDetailPageState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      productDetailPageModelObj:
          productDetailPageModelObj ?? this.productDetailPageModelObj,
    );
  }
}
