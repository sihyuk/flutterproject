import 'bloc/register_bloc.dart';
import 'models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/core/utils/validation_functions.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_icon_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) =>
            RegisterBloc(RegisterState(registerModelObj: RegisterModel()))
              ..add(RegisterInitialEvent()),
        child: RegisterScreen());
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
                    padding:
                        EdgeInsets.only(left: 16.h, top: 98.v, right: 16.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_hello_register".tr,
                              style: theme.textTheme.headlineSmall),
                          SizedBox(height: 40.v),
                          _buildFirstName(context),
                          SizedBox(height: 12.v),
                          _buildLastName(context),
                          SizedBox(height: 12.v),
                          _buildEmail(context),
                          SizedBox(height: 12.v),
                          _buildPassword(context),
                          SizedBox(height: 24.v),
                          _buildRegisterButton(context),
                          SizedBox(height: 38.v),
                          _buildOrLoginWithDivider(context),
                          SizedBox(height: 21.v),
                          _buildSocialButtons(context),
                          SizedBox(height: 43.v),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtAlreadyhavean(context);
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_already_have_an2".tr,
                                            style: theme.textTheme.bodyMedium),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "lbl_login_now".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary)
                                      ]),
                                      textAlign: TextAlign.left))),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
        selector: (state) => state.firstNameController,
        builder: (context, firstNameController) {
          return CustomTextFormField(
              controller: firstNameController,
              hintText: "lbl_first_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
        selector: (state) => state.lastNameController,
        builder: (context, lastNameController) {
          return CustomTextFormField(
              controller: lastNameController,
              hintText: "lbl_last_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_email".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_register".tr,
        onPressed: () {
          onTapRegisterButton(context);
        });
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
  Widget _buildSocialButtons(BuildContext context) {
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
  onTapRegisterButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainLandingScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
