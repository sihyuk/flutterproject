import '../models/productlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ProductlistItemWidget extends StatelessWidget {
  ProductlistItemWidget(
    this.productlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductlistItemModel productlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 171.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: productlistItemModelObj?.oliveplaindress,
            height: 236.v,
            width: 171.h,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          SizedBox(height: 11.v),
          Text(
            productlistItemModelObj.womenBlueSkinny!,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 15.v),
          Text(
            productlistItemModelObj.price!,
            style: CustomTextStyles.titleSmallPrimarySemiBold,
          ),
        ],
      ),
    );
  }
}
