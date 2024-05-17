
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/bloc_observer.dart';
import 'package:servival/core/resourses/Theme/Theme_data/theme_data_dark.dart';
import 'package:servival/core/resourses/Theme/Theme_data/theme_data_light.dart';
import 'package:servival/core/resourses/network/change_app_stats.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/signIn_cubit.dart';
import 'package:servival/fetures/donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:servival/fetures/splasView/presentation/view/splash_view.dart';
import 'core/Di/serviceLocator.dart';
import 'core/resourses/navigation_manager.dart';
import 'core/resourses/network/app_consts.dart';
import 'core/resourses/network/cash_helper.dart';
import 'core/resourses/network/change_app_mode.dart';
import 'core/resourses/network/shard.dart';
import 'fetures/RecieveView/presentation/viewModel/cubit/Receive_Blood_Request_cubit.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   settUp();
   Bloc.observer= MyBlocObserver();
  AppConsts.uIdUser= await CashHelper.readData()??'';
  await Shared.init();
  bool isDark = Shared.getBoolData(key: 'isDark')??false;
  runApp(MyApp(isDark:isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key,required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ProfileCubit()),
        BlocProvider(create: (context)=>getIt.get<SignInCubit>()),
        BlocProvider(create: (context)=>getIt.get<RequestDonationCubit>()),
        BlocProvider(create: (context)=>getIt.get<ReceiveBloodRequestCubit>()),
        BlocProvider(create: (context)=> ChangMode()..changeAppMode(fromShared: isDark)),
      ],
      child:BlocBuilder<ChangMode,ChangModeState>(
        builder: (context, state) {
          return ScreenUtilInit(
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: NavigationManager.getRout,
                  theme:ChangMode.get(context).isDark
                      ? getThemeDataDark()
                      : getThemeDataLight(),
                  home:  const SplashView(),
                );
              }
          );
        },
      ),
    );
  }
  }


