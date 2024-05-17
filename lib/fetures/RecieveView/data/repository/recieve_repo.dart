import 'package:dartz/dartz.dart';

import '../../../../core/resourses/network/error/error_firebase.dart';

abstract class ReceiveBloodRequestRepository{
  Future<Either<ErrorApp,String>> receiveBloodRequest({
  required  String name,
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
});
}