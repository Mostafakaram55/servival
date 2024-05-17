import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:servival/core/resourses/network/error/error_firebase.dart';
import 'package:servival/fetures/Auth_view/data/model/user_model.dart';
import 'package:servival/fetures/donateView/data/repository/repoDonation.dart';
import '../model/donation_model.dart';

class DonationRepositoryImp implements DonationRepository{
  UserModel? userModel;

  @override
  Future<Either<ErrorApp,String>> uploadDonationRequest({
    required String location,
    required String mentionTheDisease,
    required String doYouHaveAnyDisease,
    required String numberTimesDonation,
    required String dataLastTimeDonation,
    required String haveYouDonationBefore,
    required String bloodType,
    required String name,
    required String uId,
    required String dataTime,
  }) async{
    DonationModel model=DonationModel(
      bloodType: bloodType,
      name:name,
      uId:uId,
      dataLastTimeDonation:dataLastTimeDonation ,
      doYouHaveAnyDisease: doYouHaveAnyDisease,
      haveYouDonationBefore: haveYouDonationBefore,
      location:location,
      mentionTheDisease:mentionTheDisease ,
      numberTimesDonation:numberTimesDonation ,
      dataTime: dataTime,
    );
   await FirebaseFirestore.instance.collection('DonationRequests').add(model.toMap());
   try{
     return const Right('donation Request done');
   }on FirebaseException catch (error) {
     print(error.toString());
     return Left(FireBaseError(error.toString()));
   } catch (error) {
     print(error.toString());
     return Left(FireBaseError('hi'));
   }
  }

}