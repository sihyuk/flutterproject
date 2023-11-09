import 'bloc/profile_profile_info_bloc.dart';
import 'models/profile_profile_info_model.dart';
import 'package:flutter/material.dart';
import 'package:sihyuk_s_application1/core/app_export.dart';
import 'package:sihyuk_s_application1/core/utils/validation_functions.dart';
import 'package:sihyuk_s_application1/widgets/custom_elevated_button.dart';
import 'package:sihyuk_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileProfileInfoPage extends StatefulWidget {
  const ProfileProfileInfoPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileProfileInfoPageState createState() => ProfileProfileInfoPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileProfileInfoBloc>(
      create: (context) => ProfileProfileInfoBloc(ProfileProfileInfoState(
        profileProfileInfoModelObj: ProfileProfileInfoModel(),
      ))
        ..add(ProfileProfileInfoInitialEvent()),
      child: ProfileProfileInfoPage(),
    );
  }
}

class ProfileProfileInfoPageState extends State<ProfileProfileInfoPage>
    with AutomaticKeepAliveClientMixin<ProfileProfileInfoPage> {
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
                SizedBox(height: 38.v),
                _buildFiftyThree(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return BlocSelector<ProfileProfileInfoBloc, ProfileProfileInfoState,
        TextEditingController?>(
      selector: (state) => state.firstNameController,
      builder: (context, firstNameController) {
        return CustomTextFormField(
          controller: firstNameController,
          hintText: "lbl_archie".tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return BlocSelector<ProfileProfileInfoBloc, ProfileProfileInfoState,
        TextEditingController?>(
      selector: (state) => state.lastNameController,
      builder: (context, lastNameController) {
        return CustomTextFormField(
          controller: lastNameController,
          hintText: "lbl_copeland".tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<ProfileProfileInfoBloc, ProfileProfileInfoState,
        TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "msg_archiecopeland_gmail_com".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSaveEdit(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_save_edit".tr,
    );
  }

  /// Section Widget
  Widget _buildFiftyThree(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_first_name".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 12.v),
          _buildFirstName(context),
          SizedBox(height: 26.v),
          Text(
            "lbl_last_name".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 12.v),
          _buildLastName(context),
          SizedBox(height: 26.v),
          Text(
            "lbl_email_address".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 12.v),
          _buildEmail(context),
          SizedBox(height: 31.v),
          _buildSaveEdit(context),
        ],
      ),
    );
  }
}
