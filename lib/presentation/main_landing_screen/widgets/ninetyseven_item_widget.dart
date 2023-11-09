import '../models/ninetyseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class NinetysevenItemWidget extends StatelessWidget {
  NinetysevenItemWidget(
    this.ninetysevenItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NinetysevenItemModel ninetysevenItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ninetysevenItemModelObj?.outerwear,
          height: 386.v,
          width: 358.h,
        ),
        SizedBox(height: 26.v),
        Text(
          ninetysevenItemModelObj.outerwear1!,
          style: CustomTextStyles.titleMediumBold,
        ),
        SizedBox(height: 6.v),
        Text(
          ninetysevenItemModelObj.raincoatsSweaters!,
          style: CustomTextStyles.bodySmallBluegray400,
        ),
      ],
    );
  }
}
