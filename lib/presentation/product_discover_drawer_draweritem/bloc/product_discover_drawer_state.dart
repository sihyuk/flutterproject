// ignore_for_file: must_be_immutable

part of 'product_discover_drawer_bloc.dart';

/// Represents the state of ProductDiscoverDrawer in the application.
class ProductDiscoverDrawerState extends Equatable {
  ProductDiscoverDrawerState({this.productDiscoverDrawerModelObj});

  ProductDiscoverDrawerModel? productDiscoverDrawerModelObj;

  @override
  List<Object?> get props => [
        productDiscoverDrawerModelObj,
      ];
  ProductDiscoverDrawerState copyWith(
      {ProductDiscoverDrawerModel? productDiscoverDrawerModelObj}) {
    return ProductDiscoverDrawerState(
      productDiscoverDrawerModelObj:
          productDiscoverDrawerModelObj ?? this.productDiscoverDrawerModelObj,
    );
  }
}
