import '../models/profilemyorders_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ProfilemyordersItemWidget extends StatelessWidget {
  ProfilemyordersItemWidget(
    this.profilemyordersItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfilemyordersItemModel profilemyordersItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.h,
        vertical: 2.v,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: profilemyordersItemModelObj?.image,
            height: 110.v,
            width: 109.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profilemyordersItemModelObj.price!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 12.v),
                Text(
                  profilemyordersItemModelObj.shortsInYellow!,
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 38.v),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
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
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text(
                        profilemyordersItemModelObj.one!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
