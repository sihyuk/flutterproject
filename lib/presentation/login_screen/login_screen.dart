import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/core/utils/validation_functions.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_icon_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 249.h,
                              margin: EdgeInsets.only(left: 8.h),
                              child: Text("msg_welcome_back_glad".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.headlineSmall!
                                      .copyWith(height: 1.50))),
                          SizedBox(height: 34.v),
                          BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "msg_enter_your_email".tr,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_email"
                                            .tr;
                                      }
                                      return null;
                                    });
                              }),
                          SizedBox(height: 15.v),
                          BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "msg_enter_your_password".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<LoginBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            12.h, 12.v, 23.h, 12.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgEye,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 48.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_password"
                                        .tr;
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword,
                                contentPadding: EdgeInsets.only(
                                    left: 24.h, top: 15.v, bottom: 15.v));
                          }),
                          SizedBox(height: 24.v),
                          CustomElevatedButton(
                              text: "lbl_login".tr,
                              onPressed: () {
                                onTapLogin(context);
                              }),
                          SizedBox(height: 38.v),
                          _buildOrLoginWithDivider(context),
                          SizedBox(height: 21.v),
                          _buildSixtyFour(context),
                          SizedBox(height: 43.v),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount(context);
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "lbl_don_t_have_an".tr,
                                            style: theme.textTheme.bodyMedium),
                                        TextSpan(
                                            text: "lbl_account".tr,
                                            style: theme.textTheme.bodyMedium),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "lbl_register_now".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary)
                                      ]),
                                      textAlign: TextAlign.left))),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Section Widget
  Widget _buildOrLoginWithDivider(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 7.v, bottom: 8.v),
              child: SizedBox(width: 112.h, child: Divider())),
          Text("lbl_or_login_with".tr,
              style: CustomTextStyles.bodyMediumGray600_1),
          Padding(
              padding: EdgeInsets.only(top: 7.v, bottom: 8.v),
              child: SizedBox(width: 111.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildSixtyFour(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(right: 11.h),
              child: CustomIconButton(
                  height: 56.v,
                  width: 168.h,
                  padding: EdgeInsets.all(15.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSocialFacebookIc)))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: CustomIconButton(
                  height: 56.v,
                  width: 168.h,
                  padding: EdgeInsets.all(15.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSocialGoogleIc))))
    ]);
  }

  /// Navigates to the mainLandingScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainLandingScreen,
    );
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerScreen,
    );
  }
}
