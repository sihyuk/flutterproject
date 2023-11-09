// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'profilemyorders_item_model.dart';

/// This class defines the variables used in the [profile_my_orders_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileMyOrdersModel extends Equatable {
  ProfileMyOrdersModel({this.profilemyordersItemList = const []}) {}

  List<ProfilemyordersItemModel> profilemyordersItemList;

  ProfileMyOrdersModel copyWith(
      {List<ProfilemyordersItemModel>? profilemyordersItemList}) {
    return ProfileMyOrdersModel(
      profilemyordersItemList:
          profilemyordersItemList ?? this.profilemyordersItemList,
    );
  }

  @override
  List<Object?> get props => [profilemyordersItemList];
}
