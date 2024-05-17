import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:servival/core/resourses/network/error/error_firebase.dart';
import 'package:servival/fetures/RecieveView/data/repository/recieve_repo.dart';

import '../models/Receive_Blood_Request_model.dart';

class ReceiveBloodRequestRepositoryImp  implements ReceiveBloodRequestRepository{
  @override
  Future<Either<ErrorApp, String>> receiveBloodRequest({
    required String name,
    required String uId,
    required String patientName,
    required String patientAge,
    required String patientLocation,
    required String whyDoNeedBlood,
    required String namesMedicines,
    required String bagsNumber,
    required String relationYorWithPatient,
    required String bloodType,
    required String dataTime,

  }) async{
    ReceiveBloodModel model=ReceiveBloodModel(
      name: name,
      uId:uId ,
      bloodType:bloodType ,
      whyDoNeedBlood: whyDoNeedBlood,
      relationYorWithPatient: relationYorWithPatient,
      patientName:patientName ,
      patientLocation:patientLocation ,
       patientAge: patientAge,
      namesMedicines: namesMedicines,
      bagsNumber: bagsNumber,
      dataTime: dataTime,
    );
    await FirebaseFirestore.instance.collection('ReceiveBloodRequest').add(model.toMap());

    try{
      return const Right('Receive Blood Request done');
    }on FirebaseException catch (error) {
      print(error.toString());
      return Left(FireBaseError(error.toString()));
    } catch (error) {
      print(error.toString());
      return Left(FireBaseError('hi'));
    }
  }


  }


