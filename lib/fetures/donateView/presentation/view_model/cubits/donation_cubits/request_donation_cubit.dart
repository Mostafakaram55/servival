import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servival/core/resourses/network/app_consts.dart';
import '../../../../../../core/resourses/network/error/error_firebase.dart';
import '../../../../data/model/donation_model.dart';
import '../../../../data/repository/repoDonation.dart';
import '../../states/donation_states/requste_donation_states.dart';
import 'package:intl/intl.dart';
class RequestDonationCubit extends Cubit<RequestDonationStates>{
  RequestDonationCubit(this.donationRepository):super(RequestDonationInitialStates());

  static RequestDonationCubit get(BuildContext context)=>BlocProvider.of(context);

  DonationRepository donationRepository;

  TextEditingController endFormInDonationRequest =TextEditingController();
  TextEditingController donationRequestLocationController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController mentionTheDiseaseController =TextEditingController();

  String? donateBefore;
  String? haveAnyDisease;
  String? numberOfTimes;


  final List<String> choseItem=[
    'yes',
    'No',
  ];
  final List<String> listOfTimesNumber=[
    '1  of the times I donated',
    '2  of the times I donated',
    '3  of the times I donated',
    '4  of the times I donated',
    '5  of the times I donated',
    '6  of the times I donated',
    '7  of the times I donated',
  ];



   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Future<void> openDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;

      dateController.text =  DateFormat.yMMMd().format(pickedDate);
      emit(RequestDonationChangValueStates());
    }
  }


Future<void> addDonationRequest({
    required String name,
    required String bloodType,
    required String uId,
})async{
  emit(RequestDonationLoadingStates());
  Either<ErrorApp,String>result=await donationRepository.uploadDonationRequest(
      location:donationRequestLocationController.text ,
      mentionTheDisease: mentionTheDiseaseController.text,
      doYouHaveAnyDisease:haveAnyDisease!,
      numberTimesDonation:numberOfTimes! ,
      dataLastTimeDonation: dateController.text.toString(),
      haveYouDonationBefore: donateBefore!,
      name:name,
      bloodType: bloodType,
      uId:uId,
      dataTime:DateTime.now().toString(),
  );
   result.fold((error) {
   emit(RequestDonationErrorStates(errorMessage:error.toString()));
}, (successMessage){
  emit(RequestDonationSuccessStates(successMessage:successMessage.toString()));
});
}


  List<DonationModel>userPostsData=[];

 Future< void> getUserDonations()async{
    emit(RequestDonationGetPostsLoadingStates());
    FirebaseFirestore.instance.collection('DonationRequests').get().then((value){
      for (var element in value.docs) {
        userPostsData.add(DonationModel.fromJson(element.data()));
      }
       getPostsForCurrentUser();
      emit(RequestDonationGetPostsSuccessStates(
        postsOfUsers: userPostsData,
      ));

    }).catchError((error){
      emit(RequestDonationGetPostsErrorStates(errorMessage: error.toString()));
      print(error.toString());
    });
  }

  List<DonationModel>postsForCurrentUser=[];

  Future<void> getPostsForCurrentUser()async{
     postsForCurrentUser =  userPostsData.where((post) {
      return post.uId==AppConsts.uIdUser;
    }).toList();
  }

  List<DonationModel>searchQuery({
    required String searchItem,
    required List<DonationModel> donationList
  }){
    List<DonationModel> searchList=donationList.where((element) =>
        element.bloodType!.toLowerCase().contains(searchItem.toLowerCase())).toList();
    emit(searchINDonationChangValueStates());
    return searchList;
  }

  DateTime date1=DateTime.now();
  String? date2;
  dynamic difference;
  double? timeDonation;

  void checkData()async{
    if(userPostsData.isNotEmpty){
     await getPostsForCurrentUser();
      date2 = postsForCurrentUser[postsForCurrentUser.length-1].dataTime;
      DateTime dateFinal = DateTime.parse(date2!);
      difference = date1.difference(dateFinal);
      num value=120-difference.inDays;
      timeDonation=value.toDouble();
    }
  }
}