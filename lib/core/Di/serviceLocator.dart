import 'package:get_it/get_it.dart';
import 'package:servival/fetures/RecieveView/data/repository/recieve_repo_imp.dart';
import '../../fetures/Auth_view/data/repository/autho_repository_imp.dart';
import '../../fetures/Auth_view/presentation/view-model/cubits/signIn_cubit.dart';
import '../../fetures/Auth_view/presentation/view-model/cubits/sign_up_cubits.dart';
import '../../fetures/RecieveView/presentation/viewModel/cubit/Receive_Blood_Request_cubit.dart';
import '../../fetures/donateView/data/repository/repoImpDonation.dart';
import '../../fetures/donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';

final getIt=GetIt.instance;
void settUp(){
  getIt.registerSingleton<AuthenticationRepositoryImp> (AuthenticationRepositoryImp());
  getIt.registerSingleton<DonationRepositoryImp> (DonationRepositoryImp());
  getIt.registerSingleton<ReceiveBloodRequestRepositoryImp> (ReceiveBloodRequestRepositoryImp());

  getIt.registerFactory<ReceiveBloodRequestCubit>(() =>ReceiveBloodRequestCubit(getIt.get<ReceiveBloodRequestRepositoryImp>()));
  getIt.registerFactory<SignInCubit>(() =>SignInCubit(getIt.get<AuthenticationRepositoryImp>()));
  getIt.registerFactory<RequestDonationCubit>(() =>RequestDonationCubit(getIt.get<DonationRepositoryImp>()));

  getIt.registerFactory<SignUpCubit>(() =>SignUpCubit(getIt.get<AuthenticationRepositoryImp>()));
}