import '../product_discover_screen/widgets/productdiscoverlist_item_widget.dart';
import 'bloc/product_discover_bloc.dart';
import 'models/product_discover_model.dart';
import 'models/productdiscoverlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:sihyuk_s_application1/widgets/app_bar/custom_app_bar.dart';

class ProductDiscoverScreen extends StatelessWidget {
  const ProductDiscoverScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProductDiscoverBloc>(
        create: (context) => ProductDiscoverBloc(ProductDiscoverState(
            productDiscoverModelObj: ProductDiscoverModel()))
          ..add(ProductDiscoverInitialEvent()),
        child: ProductDiscoverScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: BlocSelector<ProductDiscoverBloc, ProductDiscoverState,
                        ProductDiscoverModel?>(
                    selector: (state) => state.productDiscoverModelObj,
                    builder: (context, productDiscoverModelObj) {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 312.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 14.h,
                                  crossAxisSpacing: 14.h),
                          physics: BouncingScrollPhysics(),
                          itemCount: productDiscoverModelObj
                                  ?.productdiscoverlistItemList.length ??
                              0,
                          itemBuilder: (context, index) {
                            ProductdiscoverlistItemModel model =
                                productDiscoverModelObj
                                        ?.productdiscoverlistItemList[index] ??
                                    ProductdiscoverlistItemModel();
                            return ProductdiscoverlistItemWidget(model);
                          });
                    }))));
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

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
