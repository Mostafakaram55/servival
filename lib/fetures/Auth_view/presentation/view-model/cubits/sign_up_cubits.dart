import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servival/fetures/Auth_view/data/model/user_model.dart';
import '../../../../../core/resourses/network/app_consts.dart';
import '../../../../../core/resourses/network/cash_helper.dart';
import '../../../../../core/resourses/network/error/error_firebase.dart';
import '../../../data/repository/autho_repository.dart';
import '../states/sign_ups_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authenticationRepository)
      : super(InitialStateSignUpStates());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConformPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final List<String> items = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
  ];

  String? selectedValue;
  void selectValue(String value){
    selectedValue=value;
    emit(SelectedValueStates());
  }
  final AuthenticationRepository authenticationRepository;
  late User user;

  Future<void> register(
      {required String email, required String password }) async {
    emit(LoadingStateSSignUpStates());
    Either<ErrorApp, UserCredential> result = await authenticationRepository
        .register(email: email, password: password);
    result.fold((error) {
      emit(ErrorStateSignUpStates(error: error.toString()));
    }, (user) {
      this.user = user.user!;
      saveUserData();
      emit(SuccessStateSignUpStates(userCredential: user));
    });
  }

  void saveUserData() async {
    emit(LoadingStateSaveDataStates());
    Either<ErrorApp, String> result =
        await authenticationRepository.saveUserData(
            userModel: UserModel(
                email: registerEmailController.text,
                phone: phoneController.text,
                name: userNameController.text,
                uId: user.uid,
                 location: locationController.text,
                bloodType: selectedValue!,
                age: int.parse(ageController.text),
            ));
    result.fold((error) {
      emit(ErrorStateSaveDataStates(error: error.toString()));
    }, (message) {
      emit(SuccessStateSaveDataStates( message:message.toString()));
    });
  }

}
