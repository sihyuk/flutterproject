import 'bloc/profile_security_bloc.dart';
import 'models/profile_security_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/core/utils/validation_functions.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileSecurityPage extends StatefulWidget {
  const ProfileSecurityPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileSecurityPageState createState() => ProfileSecurityPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileSecurityBloc>(
      create: (context) => ProfileSecurityBloc(ProfileSecurityState(
        profileSecurityModelObj: ProfileSecurityModel(),
      ))
        ..add(ProfileSecurityInitialEvent()),
      child: ProfileSecurityPage(),
    );
  }
}

class ProfileSecurityPageState extends State<ProfileSecurityPage>
    with AutomaticKeepAliveClientMixin<ProfileSecurityPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;
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
            decoration: AppDecoration.white,
            child: Column(
              children: [
                SizedBox(height: 97.v),
                _buildChangePasswordSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChangePasswordSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_change_password".tr,
            style: CustomTextStyles.titleSmallOnPrimarySemiBold_1,
          ),
          SizedBox(height: 22.v),
          Text(
            "msg_current_password".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 11.v),
          BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
              TextEditingController?>(
            selector: (state) => state.passwordController,
            builder: (context, passwordController) {
              return CustomTextFormField(
                controller: passwordController,
                hintText: "lbl_password".tr,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null ||
                      (!isValidPassword(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                obscureText: true,
              );
            },
          ),
          SizedBox(height: 27.v),
          Text(
            "lbl_new_password".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 11.v),
          BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
              TextEditingController?>(
            selector: (state) => state.newpasswordController,
            builder: (context, newpasswordController) {
              return CustomTextFormField(
                controller: newpasswordController,
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
                obscureText: true,
              );
            },
          ),
          SizedBox(height: 24.v),
          CustomElevatedButton(
            text: "lbl_update_password".tr,
            buttonStyle: CustomButtonStyles.fillGray,
          ),
        ],
      ),
    );
  }
}
