import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:sihyuk_s_application1/presentation/profile_profile_info_page/models/profile_profile_info_model.dart';
part 'profile_profile_info_event.dart';
part 'profile_profile_info_state.dart';

/// A bloc that manages the state of a ProfileProfileInfo according to the event that is dispatched to it.
class ProfileProfileInfoBloc
    extends Bloc<ProfileProfileInfoEvent, ProfileProfileInfoState> {
  ProfileProfileInfoBloc(ProfileProfileInfoState initialState)
      : super(initialState) {
    on<ProfileProfileInfoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileProfileInfoInitialEvent event,
    Emitter<ProfileProfileInfoState> emit,
  ) async {
    emit(state.copyWith(
      firstNameController: TextEditingController(),
      lastNameController: TextEditingController(),
      emailController: TextEditingController(),
    ));
  }
}
