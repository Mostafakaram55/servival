import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:servival/fetures/Auth_view/data/model/user_model.dart';
import '../../../../core/resourses/network/error/error_firebase.dart';
abstract class AuthenticationRepository{
  Future<Either<ErrorApp,UserCredential>> login({
   required String email,required String password,
}); Future<Either<ErrorApp,String>> resetPassword({
   required String email,
});
  Future<Either<ErrorApp,UserCredential>> register({
      required String email,
      required String password,
});
   Future<Either<ErrorApp,String>> saveUserData({
     required UserModel userModel,
   } );

}