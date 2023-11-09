import '../product_detail_page_screen/widgets/productcarousel_item_widget.dart';
import 'bloc/product_detail_page_bloc.dart';
import 'models/product_detail_page_model.dart';
import 'models/productcarousel_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPageScreen extends StatelessWidget {
  const ProductDetailPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProductDetailPageBloc>(
        create: (context) => ProductDetailPageBloc(ProductDetailPageState(
            productDetailPageModelObj: ProductDetailPageModel()))
          ..add(ProductDetailPageInitialEvent()),
        child: ProductDetailPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProductCarousel(context),
                              SizedBox(height: 21.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: BlocBuilder<ProductDetailPageBloc,
                                          ProductDetailPageState>(
                                      builder: (context, state) {
                                    return SizedBox(
                                        height: 4.v,
                                        child: AnimatedSmoothIndicator(
                                            activeIndex: state.sliderIndex,
                                            count: state
                                                    .productDetailPageModelObj
                                                    ?.productcarouselItemList
                                                    .length ??
                                                0,
                                            axisDirection: Axis.horizontal,
                                            effect: ScrollingDotsEffect(
                                                spacing: 4,
                                                activeDotColor:
                                                    theme.colorScheme.primary,
                                                dotColor: appTheme.gray600,
                                                dotHeight: 4.v,
                                                dotWidth: 15.h)));
                                  })),
                              SizedBox(height: 24.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 16.h),
                                  child: Text("msg_print_maxi_dress".tr,
                                      style: CustomTextStyles
                                          .headlineSmallMedium)),
                              SizedBox(height: 13.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 16.h),
                                  child: Text("lbl_99_30".tr,
                                      style: theme.textTheme.titleLarge)),
                              SizedBox(height: 29.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 16.h),
                                  child: Text("lbl_product_details".tr,
                                      style: CustomTextStyles
                                          .titleSmallOnPrimarySemiBold_1)),
                              SizedBox(height: 15.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 356.h,
                                      margin: EdgeInsets.only(
                                          left: 16.h, right: 17.h),
                                      child: Text("msg_mini_dress_with".tr,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyMediumGray600_1
                                              .copyWith(height: 1.50))))
                            ])))),
            bottomNavigationBar: _buildAddToCart(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 36.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimary,
            margin: EdgeInsets.only(left: 12.h, top: 20.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_shopsie".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildProductCarousel(BuildContext context) {
    return BlocBuilder<ProductDetailPageBloc, ProductDetailPageState>(
        builder: (context, state) {
      return CarouselSlider.builder(
          options: CarouselOptions(
              height: 289.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                state.sliderIndex = index;
              }),
          itemCount:
              state.productDetailPageModelObj?.productcarouselItemList.length ??
                  0,
          itemBuilder: (context, index, realIndex) {
            ProductcarouselItemModel model = state.productDetailPageModelObj
                    ?.productcarouselItemList[index] ??
                ProductcarouselItemModel();
            return ProductcarouselItemWidget(model);
          });
    });
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_to_cart".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 64.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
