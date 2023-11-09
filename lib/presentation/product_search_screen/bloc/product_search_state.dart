// ignore_for_file: must_be_immutable

part of 'product_search_bloc.dart';

/// Represents the state of ProductSearch in the application.
class ProductSearchState extends Equatable {
  ProductSearchState({
    this.searchBarController,
    this.productSearchModelObj,
  });

  TextEditingController? searchBarController;

  ProductSearchModel? productSearchModelObj;

  @override
  List<Object?> get props => [
        searchBarController,
        productSearchModelObj,
      ];
  ProductSearchState copyWith({
    TextEditingController? searchBarController,
    ProductSearchModel? productSearchModelObj,
  }) {
    return ProductSearchState(
      searchBarController: searchBarController ?? this.searchBarController,
      productSearchModelObj:
          productSearchModelObj ?? this.productSearchModelObj,
    );
  }
}
