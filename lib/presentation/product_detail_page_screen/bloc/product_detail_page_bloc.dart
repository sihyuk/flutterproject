import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productcarousel_item_model.dart';
import 'package:sihyuk_s_application1/presentation/product_detail_page_screen/models/product_detail_page_model.dart';
part 'product_detail_page_event.dart';
part 'product_detail_page_state.dart';

/// A bloc that manages the state of a ProductDetailPage according to the event that is dispatched to it.
class ProductDetailPageBloc
    extends Bloc<ProductDetailPageEvent, ProductDetailPageState> {
  ProductDetailPageBloc(ProductDetailPageState initialState)
      : super(initialState) {
    on<ProductDetailPageInitialEvent>(_onInitialize);
  }

  List<ProductcarouselItemModel> fillProductcarouselItemList() {
    return List.generate(1, (index) => ProductcarouselItemModel());
  }

  _onInitialize(
    ProductDetailPageInitialEvent event,
    Emitter<ProductDetailPageState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        productDetailPageModelObj: state.productDetailPageModelObj?.copyWith(
            productcarouselItemList: fillProductcarouselItemList())));
  }
}
