
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_states.dart';
import '../../../../core/resourses/network/app_consts.dart';
import '../../../Auth_view/data/model/user_model.dart';


 class ProfileCubit extends Cubit<ProfileCubitStates>{
  ProfileCubit(): super(ProfileCubitInitialStates());
  static ProfileCubit get(BuildContext context)=>BlocProvider.of(context);
  UserModel? userModel;

  Future<void> getUserData()async{
    emit(ProfileCubitLoadingStates());
    await FirebaseFirestore.instance.collection('Users').doc(AppConsts.uIdUser).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(ProfileCubitSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileCubitErrorStates(error: error.toString()));
    });
  }

  Future<void> updateUserData({
    required String name,
    required String  bloodType,
    required String  location,
    required String  phone,
    required String email,
    required String uId,
    required String age,
   // required String image,
  })async{
    emit(LoadingEditProfileState());
    UserModel model =UserModel(
        bloodType:bloodType ,
        age:int.parse(age),
        location:location ,
        name: name,
        phone: phone,
        email: email,
        uId: uId,
      //  image: image,
    );
   await FirebaseFirestore.instance.collection('Users').doc(model.uId).update(model.toMap()).then((value) {
        getUserData();
    }).catchError((error){
      emit(ErrorEditUserDataState(error: error.toString()));
    });
  }

  File? image;
  final picker=ImagePicker();
  var pickedImage;
  XFile? _imageFiles;

  Future uploadImage() async {
    pickedImage= await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      image = File(pickedImage!.path);
      _imageFiles = pickedImage;
      print(_imageFiles);
      emit(SuccessEditImageProfileState());
    }else{
      print('Image not Found');
      emit(ErrorEditImageProfileState());
    }
  }


}