import '../../../../data/model/donation_model.dart';

abstract  class RequestDonationStates{}
class RequestDonationInitialStates extends RequestDonationStates{}
class RequestDonationLoadingStates extends RequestDonationStates{}
class getPostFoDonationUserLastStates extends RequestDonationStates{}
class RequestDonationChangValueStates extends RequestDonationStates{}
class searchINDonationChangValueStates extends RequestDonationStates{}
class RequestDonationGetPostsLoadingStates extends RequestDonationStates{}
class RequestDonationGetPostsSuccessStates extends RequestDonationStates{
  final List<DonationModel> postsOfUsers;

  RequestDonationGetPostsSuccessStates({required this.postsOfUsers});
}
class RequestDonationGetPostsErrorStates extends RequestDonationStates{
  final String errorMessage;

  RequestDonationGetPostsErrorStates({required this.errorMessage});
}
class AppGetUserLoadingState extends RequestDonationStates{}
class AppGetUserSuccessState extends RequestDonationStates{}
class AppGetUserErrorState extends RequestDonationStates{
  final String error;

  AppGetUserErrorState({required this.error});
}
class RequestDonationSuccessStates extends RequestDonationStates{
  final String successMessage;

  RequestDonationSuccessStates({required this.successMessage});
}
class RequestDonationErrorStates extends RequestDonationStates{
  final String errorMessage;

  RequestDonationErrorStates({required this.errorMessage});
}