import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productsearchlist_item_model.dart';
import 'package:sihyuk_s_application1/presentation/product_search_screen/models/product_search_model.dart';
part 'product_search_event.dart';
part 'product_search_state.dart';

/// A bloc that manages the state of a ProductSearch according to the event that is dispatched to it.
class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc(ProductSearchState initialState) : super(initialState) {
    on<ProductSearchInitialEvent>(_onInitialize);
  }

  List<ProductsearchlistItemModel> fillProductsearchlistItemList() {
    return [
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage171x171,
          longSleeveTShirt: "Long Sleeve T-shirt"),
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage7,
          longSleeveTShirt: "Sliders"),
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage8,
          longSleeveTShirt: "Slippers"),
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage9,
          longSleeveTShirt: "Long Sleeve Top"),
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage10,
          longSleeveTShirt: "Slip Dress"),
      ProductsearchlistItemModel(
          longSleeveTshirt: ImageConstant.imgImage11,
          longSleeveTShirt: "Nike Slides")
    ];
  }

  _onInitialize(
    ProductSearchInitialEvent event,
    Emitter<ProductSearchState> emit,
  ) async {
    emit(state.copyWith(
      searchBarController: TextEditingController(),
    ));
    emit(state.copyWith(
        productSearchModelObj: state.productSearchModelObj?.copyWith(
      productsearchlistItemList: fillProductsearchlistItemList(),
    )));
  }
}
