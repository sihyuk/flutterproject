import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profilemyorders_item_model.dart';
import 'package:sihyuk_s_application1/presentation/profile_my_orders_page/models/profile_my_orders_model.dart';
part 'profile_my_orders_event.dart';
part 'profile_my_orders_state.dart';

/// A bloc that manages the state of a ProfileMyOrders according to the event that is dispatched to it.
class ProfileMyOrdersBloc
    extends Bloc<ProfileMyOrdersEvent, ProfileMyOrdersState> {
  ProfileMyOrdersBloc(ProfileMyOrdersState initialState) : super(initialState) {
    on<ProfileMyOrdersInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileMyOrdersInitialEvent event,
    Emitter<ProfileMyOrdersState> emit,
  ) async {
    emit(state.copyWith(
        profileMyOrdersModelObj: state.profileMyOrdersModelObj?.copyWith(
      profilemyordersItemList: fillProfilemyordersItemList(),
    )));
  }

  List<ProfilemyordersItemModel> fillProfilemyordersItemList() {
    return [
      ProfilemyordersItemModel(
          image: ImageConstant.imgImage110x109,
          price: "12.50",
          shortsInYellow: "shorts in Yellow",
          one: "1"),
      ProfilemyordersItemModel(
          image: ImageConstant.imgImage12,
          price: "99.30",
          shortsInYellow: "Print Maxi Dress",
          one: "1")
    ];
  }
}
