import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:servival/fetures/Auth_view/data/model/user_model.dart';
import 'package:servival/fetures/Auth_view/data/repository/autho_repository.dart';
import '../../../../core/resourses/network/error/error_firebase.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<Either<ErrorApp, UserCredential>> login(
      {required String email, required String password}) async {
    try {
     UserCredential user =  await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return  Right(user);
    } on FirebaseException catch (error) {
      return Left(FireBaseError(error.message.toString()));
    } catch (error) {
      return Left(FireBaseError(error.toString()));
    }
  }

  @override
  Future<Either<ErrorApp, UserCredential>> register(
      {required String email, required String password,}) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return Right(user);
    } on FirebaseException catch (error) {
      print(error.toString());
      print('======================');
      return Left(FireBaseError('hi'));
    } catch (error) {
      print(error.toString());
      print('======================');
      return Left(FireBaseError('hi'));
    }
  }


  @override
  Future<Either<ErrorApp, String>> saveUserData(
      {required UserModel userModel}) async {
    try {
      await firebaseFireStore.collection('Users').doc(userModel.uId).set(userModel.toMap());
      return const Right('Saved user data ');
    } on FirebaseException catch (error) {

      return Left(FireBaseError(error.message.toString()));
    } catch (error) {

      return Left(FireBaseError(error.toString()));
    }
  }

  @override
  Future<Either<ErrorApp, String>> resetPassword({required String email}) async{
     {
      try {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        return const Right('A password recovery link has been sent to your email');
      } on FirebaseException catch (error) {
        return Left(FireBaseError(error.message.toString()));
      } catch (error) {
        return Left(FireBaseError(error.toString()));
      }
    }
  }


}
