// ignore_for_file: must_be_immutable

part of 'profile_profile_info_bloc.dart';

/// Represents the state of ProfileProfileInfo in the application.
class ProfileProfileInfoState extends Equatable {
  ProfileProfileInfoState({
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.profileProfileInfoModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? emailController;

  ProfileProfileInfoModel? profileProfileInfoModelObj;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameController,
        emailController,
        profileProfileInfoModelObj,
      ];
  ProfileProfileInfoState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    ProfileProfileInfoModel? profileProfileInfoModelObj,
  }) {
    return ProfileProfileInfoState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      profileProfileInfoModelObj:
          profileProfileInfoModelObj ?? this.profileProfileInfoModelObj,
    );
  }
}
