import '../models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  CartItemWidget(
    this.cartItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CartItemModel cartItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageView(
          imagePath: cartItemModelObj?.image,
          height: 110.v,
          width: 109.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 233.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItemModelObj.price!,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 12.v),
                        Text(
                          cartItemModelObj.shortsInYellow!,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgTrash2,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.only(bottom: 34.v),
                  ),
                ],
              ),
            ),
            SizedBox(height: 31.v),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.v),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_qty2".tr,
                          style: CustomTextStyles.bodyMediumGray600,
                        ),
                        TextSpan(
                          text: " ",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPlusSquare,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 21.h),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 3.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    cartItemModelObj.one!,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPlusSquarePrimary,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 12.h),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
