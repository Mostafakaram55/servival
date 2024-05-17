import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resourses/network/error/error_firebase.dart';
import '../../../data/repository/autho_repository.dart';
import '../states/signIn_states.dart';

class SignInCubit extends Cubit<SignInstates>{
  SignInCubit(this.authenticationRepository):super (InitialStateSignIn());
  static SignInCubit get(BuildContext context)=>BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
 final  AuthenticationRepository authenticationRepository;

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
Future<void> logIn({required String email ,required String password})async {
  emit(LoadingStateSignIn());
 Either<ErrorApp,UserCredential> result= await authenticationRepository.login(
      email: email,
      password: password
  );
  result.fold((error){
    emit(ErrorStateSignIn(error: error.toString()));
  }, (user) {
    emit(SuccessStateSignIn(userCredential: user));
  });
}
  Future<void>resetPassword({
    required String email,
})async{
    emit(ResetPasswordLoading());
    Either<ErrorApp,String> resetPassword= await authenticationRepository.resetPassword(email: email);
    resetPassword.fold((error) {
      print('ErrorMessage++++++++++++++++++++');
      emit(ResetPasswordError(errorMessage: error.toString()));
    }, (messageSuccess){
      print('successMessage+++++++++++++++++++');
      emit(ResetPasswordSuccess(message: messageSuccess.toString()));
    });

  }

}