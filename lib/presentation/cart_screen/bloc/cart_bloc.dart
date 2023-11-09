import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cart_item_model.dart';
import 'package:sihyuk_s_application1/presentation/cart_screen/models/cart_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

/// A bloc that manages the state of a Cart according to the event that is dispatched to it.
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState) {
    on<CartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(
        cartModelObj:
            state.cartModelObj?.copyWith(cartItemList: fillCartItemList())));
  }

  List<CartItemModel> fillCartItemList() {
    return [
      CartItemModel(
          image: ImageConstant.imgImage110x109,
          price: "12.50",
          shortsInYellow: "shorts in Yellow",
          one: "1"),
      CartItemModel(
          image: ImageConstant.imgImage12,
          price: "99.30",
          shortsInYellow: "Print Maxi Dress",
          one: "1")
    ];
  }
}
