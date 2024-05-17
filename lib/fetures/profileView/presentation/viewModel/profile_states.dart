abstract class ProfileCubitStates{}
class ProfileCubitInitialStates extends ProfileCubitStates{}
class ProfileCubitLoadingStates extends ProfileCubitStates{}
class ProfileCubitSuccessStates extends ProfileCubitStates{}
class LoadingEditProfileState extends ProfileCubitStates{}
class UploadImageLoadingState extends ProfileCubitStates{}
class ErrorEditImageProfileState extends ProfileCubitStates{}
class SuccessEditImageProfileState extends ProfileCubitStates{}
class UploadImageFailureState extends ProfileCubitStates{
  final String error;

  UploadImageFailureState({required this.error});
}

class UploadImageSuccessState extends ProfileCubitStates{
  final String message;

  UploadImageSuccessState({required this.message});
}

class SuccessEditProfileState extends ProfileCubitStates{}
class ErrorEditUserDataState extends ProfileCubitStates{
  final String error;

  ErrorEditUserDataState({required this.error});
}
class ProfileCubitErrorStates extends ProfileCubitStates{
  final String error;

  ProfileCubitErrorStates({required this.error});
}
