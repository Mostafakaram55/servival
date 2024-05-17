import 'package:dartz/dartz.dart';
import 'package:servival/core/resourses/network/error/error_firebase.dart';

abstract class DonationRepository{
  Future<Either<ErrorApp,String>> uploadDonationRequest({
    required  String location,
    required String mentionTheDisease,
    required String doYouHaveAnyDisease,
    required String numberTimesDonation,
    required String dataLastTimeDonation,
    required String haveYouDonationBefore,
    required String bloodType,
    required String name,
    required String uId,
    required String dataTime,
  });

}