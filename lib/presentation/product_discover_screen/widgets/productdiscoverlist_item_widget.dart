import '../models/productdiscoverlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ProductdiscoverlistItemWidget extends StatelessWidget {
  ProductdiscoverlistItemWidget(
    this.productdiscoverlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductdiscoverlistItemModel productdiscoverlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: productdiscoverlistItemModelObj?.image,
          height: 236.v,
          width: 171.h,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
        SizedBox(height: 10.v),
        SizedBox(
          width: 153.h,
          child: Text(
            productdiscoverlistItemModelObj.womenBlueSkinny!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodySmallOnPrimary.copyWith(
              height: 1.50,
            ),
          ),
        ),
        SizedBox(height: 12.v),
        Text(
          productdiscoverlistItemModelObj.price!,
          style: CustomTextStyles.titleSmallPrimarySemiBold,
        ),
      ],
    );
  }
}
