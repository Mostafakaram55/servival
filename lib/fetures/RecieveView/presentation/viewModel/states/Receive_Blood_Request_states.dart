import '../../../data/models/Receive_Blood_Request_model.dart';

abstract class ReceiveBloodRequestStates{}
class ReceiveBloodRequestInitialState extends ReceiveBloodRequestStates{}
class ReceiveBloodRequestLoadingState extends ReceiveBloodRequestStates{}

class AppGetUserLoadingState extends ReceiveBloodRequestStates{}
class AppGetUserSuccessState extends ReceiveBloodRequestStates{}
class AppGetUserErrorState extends ReceiveBloodRequestStates{
  final String error;

  AppGetUserErrorState({required this.error});
}

class RequestBloodGetPostsLoadingStates extends ReceiveBloodRequestStates{}
class RequestBloodGetPostsSuccessStates extends ReceiveBloodRequestStates{
  final List<ReceiveBloodModel>getUserPosts;

  RequestBloodGetPostsSuccessStates({required this.getUserPosts});
}
class RequestBloodGetPostsErrorStates extends ReceiveBloodRequestStates{
  final String error;

  RequestBloodGetPostsErrorStates({required this.error});
}

class ReceiveBloodRequestSuccessState extends ReceiveBloodRequestStates{
  final String messageSuccess;

  ReceiveBloodRequestSuccessState({required this.messageSuccess});
}
class ReceiveBloodRequestErrorState extends ReceiveBloodRequestStates{
  final String errorMessage;

  ReceiveBloodRequestErrorState({required this.errorMessage});
}
