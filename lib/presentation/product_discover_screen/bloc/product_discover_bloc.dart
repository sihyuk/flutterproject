import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productdiscoverlist_item_model.dart';
import 'package:sihyuk_s_application1/presentation/product_discover_screen/models/product_discover_model.dart';
part 'product_discover_event.dart';
part 'product_discover_state.dart';

/// A bloc that manages the state of a ProductDiscover according to the event that is dispatched to it.
class ProductDiscoverBloc
    extends Bloc<ProductDiscoverEvent, ProductDiscoverState> {
  ProductDiscoverBloc(ProductDiscoverState initialState) : super(initialState) {
    on<ProductDiscoverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProductDiscoverInitialEvent event,
    Emitter<ProductDiscoverState> emit,
  ) async {
    emit(state.copyWith(
        productDiscoverModelObj: state.productDiscoverModelObj?.copyWith(
            productdiscoverlistItemList: fillProductdiscoverlistItemList())));
  }

  List<ProductdiscoverlistItemModel> fillProductdiscoverlistItemList() {
    return [
      ProductdiscoverlistItemModel(
          image: ImageConstant.imgImage3,
          womenBlueSkinny: "Women Blue Skinny Fit High-Rise Light Fade ",
          price: " 13.99"),
      ProductdiscoverlistItemModel(
          image: ImageConstant.imgImage4,
          womenBlueSkinny: "Blue Pure Cotton Relaxed Fit High-Rise Clean Look ",
          price: " 24.99"),
      ProductdiscoverlistItemModel(
          image: ImageConstant.imgImage5,
          womenBlueSkinny: "Women Blue Skinny Fit High-Rise Light Fade ",
          price: " 13.99"),
      ProductdiscoverlistItemModel(
          image: ImageConstant.imgImage6,
          womenBlueSkinny: "Fit High-Rise Clean Look Stretchable Cropped Jeans",
          price: " 24.99")
    ];
  }
}
