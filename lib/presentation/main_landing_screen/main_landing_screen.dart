import '../main_landing_screen/widgets/mainlanding_item_widget.dart';
import '../main_landing_screen/widgets/ninetyseven_item_widget.dart';
import '../main_landing_screen/widgets/productlist_item_widget.dart';
import 'bloc/main_landing_bloc.dart';
import 'models/main_landing_model.dart';
import 'models/mainlanding_item_model.dart';
import 'models/ninetyseven_item_model.dart';
import 'models/productlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/core/utils/validation_functions.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sihyuk_s_application1/widgets/custom_drop_down.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_outlined_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_text_form_field.dart';

class MainLandingScreen extends StatelessWidget {
  MainLandingScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<MainLandingBloc>(
      create: (context) => MainLandingBloc(MainLandingState(
        mainLandingModelObj: MainLandingModel(),
      ))
        ..add(MainLandingInitialEvent()),
      child: MainLandingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 4.v),
            child: Column(
              children: [
                SizedBox(height: 3.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Column(
                        children: [
                          _buildSeasonSale(context),
                          SizedBox(height: 66.v),
                          Text(
                            "lbl_trending_now".tr.toUpperCase(),
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 34.v),
                          _buildCategoriesOption(context),
                          SizedBox(height: 32.v),
                          _buildProductList(context),
                          SizedBox(height: 54.v),
                          _buildActualCategoriesColumn(context),
                          SizedBox(height: 48.v),
                          _buildOnlyTrustedBrandsColumn(context),
                          SizedBox(height: 45.v),
                          _buildNewArrivalColumn(context),
                          SizedBox(height: 43.v),
                          Text(
                            "msg_recomended_looks".tr.toUpperCase(),
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 44.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                right: 98.h,
                              ),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "lbl_gender2".tr,
                                          style: CustomTextStyles
                                              .titleSmallGray600,
                                        ),
                                        TextSpan(
                                          text: "lbl".tr,
                                          style:
                                              CustomTextStyles.titleSmallBold_1,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: BlocSelector<MainLandingBloc,
                                        MainLandingState, MainLandingModel?>(
                                      selector: (state) =>
                                          state.mainLandingModelObj,
                                      builder: (context, mainLandingModelObj) {
                                        return CustomDropDown(
                                          width: 63.h,
                                          icon: Container(
                                            margin: EdgeInsets.only(left: 6.h),
                                            child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgChevronright2,
                                              height: 12.adaptSize,
                                              width: 12.adaptSize,
                                            ),
                                          ),
                                          hintText: "lbl_female".tr,
                                          items: mainLandingModelObj
                                                  ?.dropdownItemList ??
                                              [],
                                          onChanged: (value) {
                                            context.read<MainLandingBloc>().add(
                                                ChangeDropDownEvent(
                                                    value: value));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 23.h),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "lbl_style2".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600,
                                          ),
                                          TextSpan(
                                            text: "lbl2".tr,
                                            style: CustomTextStyles
                                                .titleSmallBold_1,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: BlocSelector<MainLandingBloc,
                                        MainLandingState, MainLandingModel?>(
                                      selector: (state) =>
                                          state.mainLandingModelObj,
                                      builder: (context, mainLandingModelObj) {
                                        return CustomDropDown(
                                          width: 83.h,
                                          icon: Container(
                                            margin: EdgeInsets.only(left: 6.h),
                                            child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgChevronright2,
                                              height: 12.adaptSize,
                                              width: 12.adaptSize,
                                            ),
                                          ),
                                          hintText: "lbl_partywear".tr,
                                          items: mainLandingModelObj
                                                  ?.dropdownItemList1 ??
                                              [],
                                          onChanged: (value) {
                                            context.read<MainLandingBloc>().add(
                                                ChangeDropDown1Event(
                                                    value: value));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "lbl_price_range2".tr,
                                            style: CustomTextStyles
                                                .titleSmallGray600,
                                          ),
                                          TextSpan(
                                            text: "lbl2".tr,
                                            style: CustomTextStyles
                                                .titleSmallBold_1,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: BlocSelector<MainLandingBloc,
                                        MainLandingState, MainLandingModel?>(
                                      selector: (state) =>
                                          state.mainLandingModelObj,
                                      builder: (context, mainLandingModelObj) {
                                        return CustomDropDown(
                                          width: 31.h,
                                          icon: Container(
                                            margin: EdgeInsets.only(left: 2.h),
                                            child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgChevronright2,
                                              height: 12.adaptSize,
                                              width: 12.adaptSize,
                                            ),
                                          ),
                                          hintText: "lbl_all".tr,
                                          items: mainLandingModelObj
                                                  ?.dropdownItemList2 ??
                                              [],
                                          onChanged: (value) {
                                            context.read<MainLandingBloc>().add(
                                                ChangeDropDown2Event(
                                                    value: value));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 21.v),
                          _buildRecommendedColumn(context),
                          SizedBox(height: 49.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(left: 32.h),
                              ),
                            ],
                          ),
                          SizedBox(height: 64.v),
                          _buildContactColumn(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildFooterRow(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 32.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.only(
          left: 12.h,
          top: 17.v,
          bottom: 22.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_shopsie".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgCar,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 22.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeasonSale(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray,
      child: Column(
        children: [
          SizedBox(height: 24.v),
          SizedBox(
            height: 362.v,
            width: 360.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage61,
                  height: 362.v,
                  width: 360.h,
                  radius: BorderRadius.vertical(
                    top: Radius.circular(200.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 59.h,
                      vertical: 13.v,
                    ),
                    decoration: AppDecoration.shadow.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL200,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 224.v),
                        Text(
                          "lbl_season_sale".tr.toUpperCase(),
                          style: theme.textTheme.displaySmall,
                        ),
                        SizedBox(height: 4.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_up_to".tr.toUpperCase(),
                                style: CustomTextStyles
                                    .titleMediumPrimaryContainer,
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: "lbl_60_off".tr.toUpperCase(),
                                style: CustomTextStyles.displaySmallLatoGray300,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.v),
          CustomImageView(
            imagePath: ImageConstant.imgUnion,
            height: 48.v,
            width: 134.h,
          ),
          SizedBox(height: 48.v),
          CustomImageView(
            imagePath: ImageConstant.imgImage60,
            height: 123.v,
            width: 390.h,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAllButton(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 48.h,
      text: "lbl_all".tr,
      buttonTextStyle: CustomTextStyles.bodyMediumPrimaryContainer,
    );
  }

  /// Section Widget
  Widget _buildDressesButton(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 80.h,
      text: "lbl_dresses".tr,
      margin: EdgeInsets.only(left: 8.h),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: theme.textTheme.bodyMedium!,
    );
  }

  /// Section Widget
  Widget _buildAccessoriesButton(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 103.h,
      text: "lbl_accessories".tr,
      margin: EdgeInsets.only(left: 8.h),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: theme.textTheme.bodyMedium!,
    );
  }

  /// Section Widget
  Widget _buildDressesButton2(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 66.h,
      text: "lbl_dresses".tr,
      margin: EdgeInsets.only(left: 8.h),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: theme.textTheme.bodyMedium!,
    );
  }

  /// Section Widget
  Widget _buildCategoriesOption(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.h,
          right: 53.h,
        ),
        child: Row(
          children: [
            _buildAllButton(context),
            _buildDressesButton(context),
            _buildAccessoriesButton(context),
            _buildDressesButton2(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    return SizedBox(
      height: 296.v,
      child: BlocSelector<MainLandingBloc, MainLandingState, MainLandingModel?>(
        selector: (state) => state.mainLandingModelObj,
        builder: (context, mainLandingModelObj) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: mainLandingModelObj?.productlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              ProductlistItemModel model =
                  mainLandingModelObj?.productlistItemList[index] ??
                      ProductlistItemModel();
              return ProductlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildActualCategoriesColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          Text(
            "msg_actual_categories".tr.toUpperCase(),
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 34.v),
          BlocSelector<MainLandingBloc, MainLandingState, MainLandingModel?>(
            selector: (state) => state.mainLandingModelObj,
            builder: (context, mainLandingModelObj) {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 24.v,
                  );
                },
                itemCount: mainLandingModelObj?.ninetysevenItemList.length ?? 0,
                itemBuilder: (context, index) {
                  NinetysevenItemModel model =
                      mainLandingModelObj?.ninetysevenItemList[index] ??
                          NinetysevenItemModel();
                  return NinetysevenItemWidget(
                    model,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOnlyTrustedBrandsColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          "msg_only_trusted_brands".tr.toUpperCase(),
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(height: 37.v),
        BlocSelector<MainLandingBloc, MainLandingState, MainLandingModel?>(
          selector: (state) => state.mainLandingModelObj,
          builder: (context, mainLandingModelObj) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 59.v,
                crossAxisCount: 3,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.h,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: mainLandingModelObj?.mainlandingItemList.length ?? 0,
              itemBuilder: (context, index) {
                MainlandingItemModel model =
                    mainLandingModelObj?.mainlandingItemList[index] ??
                        MainlandingItemModel();
                return MainlandingItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildNewArrivalColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 48.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.fillBlack,
      child: Column(
        children: [
          SizedBox(height: 49.v),
          Text(
            "lbl_new_arrival".tr.toUpperCase(),
            style: CustomTextStyles.displaySmallGray40001,
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_fall_2021".tr.toUpperCase(),
            style: CustomTextStyles.bodyLargeGray40001,
          ),
          SizedBox(height: 86.v),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle1381,
            height: 354.v,
            width: 292.h,
            radius: BorderRadius.vertical(
              top: Radius.circular(279.h),
            ),
          ),
          SizedBox(height: 40.v),
          CustomElevatedButton(
            width: 174.h,
            text: "lbl_explore".tr,
            buttonStyle: CustomButtonStyles.fillPrimaryContainer,
            buttonTextStyle: CustomTextStyles.titleMediumPrimary,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBuyItNowButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_buy_it_now".tr,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildRecommendedColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle1385,
            height: 407.v,
            width: 346.h,
          ),
          SizedBox(height: 33.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_in_this_look".tr,
              style: CustomTextStyles.bodyLarge16,
            ),
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage56x56,
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  radius: BorderRadius.circular(
                    28.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 8.v,
                    bottom: 8.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_43_90".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        "msg_cotton_black_dress".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Align(
            alignment: Alignment.centerRight,
            child: Divider(
              indent: 82.h,
              endIndent: 21.h,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              right: 80.h,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  radius: BorderRadius.circular(
                    28.h,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 8.v,
                      bottom: 8.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_12_50".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          "msg_saddle_shoulder".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Align(
            alignment: Alignment.centerRight,
            child: Divider(
              indent: 82.h,
              endIndent: 21.h,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage2,
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  radius: BorderRadius.circular(
                    28.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 8.v,
                    bottom: 8.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_99_30".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        "lbl_leather_shoes".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Align(
            alignment: Alignment.centerRight,
            child: Divider(
              indent: 82.h,
              endIndent: 21.h,
            ),
          ),
          SizedBox(height: 19.v),
          _buildBuyItNowButton(context),
          SizedBox(height: 18.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContactColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.fillIndigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.v),
          CustomImageView(
            imagePath: ImageConstant.imgImage14,
            height: 204.v,
            width: 231.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 42.v),
          Text(
            "lbl_get_20_off".tr.toUpperCase(),
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 15.v),
          Text(
            "msg_leave_your_email".tr,
            style: CustomTextStyles.bodyMediumBluegray400,
          ),
          SizedBox(height: 28.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocSelector<MainLandingBloc, MainLandingState,
                  TextEditingController?>(
                selector: (state) => state.emailController,
                builder: (context, emailController) {
                  return CustomTextFormField(
                    width: 234.h,
                    controller: emailController,
                    hintText: "lbl_email".tr,
                    hintStyle: CustomTextStyles.labelLargeBluegray400,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_email".tr;
                      }
                      return null;
                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 12.v,
                    ),
                    borderDecoration:
                        TextFormFieldStyleHelper.fillPrimaryContainer,
                    fillColor: theme.colorScheme.primaryContainer,
                  );
                },
              ),
              CustomElevatedButton(
                height: 40.v,
                width: 114.h,
                text: "lbl_subscribe".tr,
                buttonTextStyle: CustomTextStyles.titleSmallPrimaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFooterRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.h,
        right: 22.h,
        bottom: 46.v,
      ),
      decoration: AppDecoration.fillOnPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "lbl_2021_shopsie".tr,
            style: theme.textTheme.bodySmall,
          ),
          Spacer(
            flex: 77,
          ),
          Text(
            "msg_privacy_cookies".tr,
            style: CustomTextStyles.bodySmallGray300,
          ),
          Spacer(
            flex: 22,
          ),
          Text(
            "lbl_ts_cs".tr,
            style: CustomTextStyles.bodySmallGray300,
          ),
        ],
      ),
    );
  }
}
