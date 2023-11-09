import '../models/productsearchlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ProductsearchlistItemWidget extends StatelessWidget {
  ProductsearchlistItemWidget(
    this.productsearchlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductsearchlistItemModel productsearchlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: productsearchlistItemModelObj?.longSleeveTshirt,
          height: 171.adaptSize,
          width: 171.adaptSize,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
        SizedBox(height: 11.v),
        Text(
          productsearchlistItemModelObj.longSleeveTShirt!,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
