import '../../../core/app_export.dart';

/// This class is used in the [ninetyseven_item_widget] screen.
class NinetysevenItemModel {
  NinetysevenItemModel({
    this.outerwear,
    this.outerwear1,
    this.raincoatsSweaters,
    this.id,
  }) {
    outerwear = outerwear ?? ImageConstant.imgRectangle7;
    outerwear1 = outerwear1 ?? "Outerwear";
    raincoatsSweaters = raincoatsSweaters ?? "Raincoats, sweaters, etc.";
    id = id ?? "";
  }

  String? outerwear;

  String? outerwear1;

  String? raincoatsSweaters;

  String? id;
}
