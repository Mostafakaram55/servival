import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resourses/network/app_consts.dart';
import '../../../../../core/resourses/network/error/error_firebase.dart';
import '../../../../Auth_view/data/model/user_model.dart';

import '../../../data/models/Receive_Blood_Request_model.dart';
import '../../../data/repository/recieve_repo.dart';
import '../states/Receive_Blood_Request_states.dart';

class ReceiveBloodRequestCubit extends Cubit<ReceiveBloodRequestStates>{
  ReceiveBloodRequestCubit(this.receiveBloodRequestRepository):super(ReceiveBloodRequestInitialState());
  static ReceiveBloodRequestCubit get(BuildContext context)=>BlocProvider.of(context);
  ReceiveBloodRequestRepository receiveBloodRequestRepository;

  TextEditingController patientNameController  =TextEditingController();
  TextEditingController patientAgeController  =TextEditingController();
  TextEditingController patientLocationController  =TextEditingController();
  TextEditingController  needBloodController  =TextEditingController();
  TextEditingController namesOfMedicinesController  =TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? chooseBloodBags;
  String? chooseRelation;
  String? chooseBloodType;
  final List<String> bloodType = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
  ];

  final List<String> bloodBagsList=[
    '1 ',
    '2 ',
    '3 ',
    '4 ',
    '5 ',
    '6 ',
    '7 ',
  ];
  final List<String> relationsList=[
    'Relationship: father',
    'Relationship: mother',
    'Relationship: sister',
    'Relationship: Brother',
    'Relationship: relative',
    'Relationship: husband/wife',
  ];


  Future<void> receiveBloodRequests({
    required String name,
    required String uId,
})async{
    emit(ReceiveBloodRequestLoadingState());
    Either<ErrorApp,String>result=await receiveBloodRequestRepository.receiveBloodRequest(
        name:name,
        uId: uId,
        patientName: patientNameController.text,
        patientAge: patientAgeController.text,
        patientLocation: patientLocationController.text,
        whyDoNeedBlood: needBloodController.text,
        namesMedicines: namesOfMedicinesController.text,
        bagsNumber: chooseBloodBags!,
        relationYorWithPatient: chooseRelation!,
        bloodType: chooseBloodType!,
      dataTime: DateTime.now().toString(),
    );
    result.fold((error) {
      emit(ReceiveBloodRequestErrorState(errorMessage:error.toString()));
    }, (successMessage){
      emit(ReceiveBloodRequestSuccessState(messageSuccess: successMessage.toString()));
    });
  }


  List<ReceiveBloodModel>userPostsData=[];

  Future< void> getReceiveBloodRequests()async{
    emit(RequestBloodGetPostsLoadingStates());
    FirebaseFirestore.instance.collection('ReceiveBloodRequest').get().then((value){
      for (var element in value.docs) {
        userPostsData.add(ReceiveBloodModel.fromJson(element.data()));
      }
      emit(RequestBloodGetPostsSuccessStates(
        getUserPosts: userPostsData,
      ));
    }).catchError((error){
      emit(RequestBloodGetPostsErrorStates( error: error.toString()));
      print(error.toString());
    });
  }

}