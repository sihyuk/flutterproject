import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productlist_item_model.dart';
import '../models/ninetyseven_item_model.dart';
import '../models/mainlanding_item_model.dart';
import 'package:sihyuk_s_application1/presentation/main_landing_screen/models/main_landing_model.dart';
part 'main_landing_event.dart';
part 'main_landing_state.dart';

/// A bloc that manages the state of a MainLanding according to the event that is dispatched to it.
class MainLandingBloc extends Bloc<MainLandingEvent, MainLandingState> {
  MainLandingBloc(MainLandingState initialState) : super(initialState) {
    on<MainLandingInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
    ));
  }

  List<ProductlistItemModel> fillProductlistItemList() {
    return [
      ProductlistItemModel(
          oliveplaindress: ImageConstant.imgImage,
          womenBlueSkinny: "Olive plain dress",
          price: " 13.99"),
      ProductlistItemModel(
          oliveplaindress: ImageConstant.imgImage236x171,
          womenBlueSkinny: "Shoes on heels",
          price: " 28.99"),
      ProductlistItemModel(
          oliveplaindress: ImageConstant.imgImage,
          womenBlueSkinny: "Olive plain dress",
          price: " 20.99")
    ];
  }

  List<NinetysevenItemModel> fillNinetysevenItemList() {
    return [
      NinetysevenItemModel(
          outerwear: ImageConstant.imgRectangle7,
          outerwear1: "Outerwear",
          raincoatsSweaters: "Raincoats, sweaters, etc."),
      NinetysevenItemModel(
          outerwear: ImageConstant.imgRectangle7386x358,
          outerwear1: "Leather shoes",
          raincoatsSweaters: "Shoes, sandals, etc."),
      NinetysevenItemModel(
          outerwear: ImageConstant.imgRectangle8,
          outerwear1: "Light dresses",
          raincoatsSweaters: "Evening, casual, home")
    ];
  }

  List<MainlandingItemModel> fillMainlandingItemList() {
    return [
      MainlandingItemModel(image: ImageConstant.imgImage15),
      MainlandingItemModel(image: ImageConstant.imgImage16),
      MainlandingItemModel(image: ImageConstant.imgImage17),
      MainlandingItemModel(image: ImageConstant.imgImage18),
      MainlandingItemModel(image: ImageConstant.imgImage19),
      MainlandingItemModel(image: ImageConstant.imgImage20)
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    MainLandingInitialEvent event,
    Emitter<MainLandingState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
    emit(state.copyWith(
        mainLandingModelObj: state.mainLandingModelObj?.copyWith(
      productlistItemList: fillProductlistItemList(),
      ninetysevenItemList: fillNinetysevenItemList(),
      mainlandingItemList: fillMainlandingItemList(),
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }
}
