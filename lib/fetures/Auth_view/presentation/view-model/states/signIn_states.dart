import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInstates{
 const  SignInstates();
}

class InitialStateSignIn extends SignInstates{}
class LoadingStateSignIn extends SignInstates{}
class ResetPasswordLoading extends SignInstates{}
class ResetPasswordSuccess extends SignInstates{
  final String message;

  ResetPasswordSuccess({required this.message});
}
class ResetPasswordError extends SignInstates{
  final String errorMessage;

  ResetPasswordError({required this.errorMessage});
}


class SuccessStateSignIn extends SignInstates{
 final  UserCredential userCredential;

  const SuccessStateSignIn({required this.userCredential});
}
class ErrorStateSignIn extends SignInstates{
  final String error;

  ErrorStateSignIn({required this.error});
}