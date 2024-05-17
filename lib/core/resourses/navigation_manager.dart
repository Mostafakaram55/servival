
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servival/core/Di/serviceLocator.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/signIn_cubit.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/sign_up_cubits.dart';
import 'package:servival/fetures/Auth_view/presentation/view/change_password_view.dart';
import 'package:servival/fetures/Auth_view/presentation/view/sign_in_view.dart';
import 'package:servival/fetures/Auth_view/presentation/view/sign_up_view.dart';
import 'package:servival/fetures/donateView/presentation/view/donateView.dart';
import 'package:servival/fetures/homeView/presentation/view/home_lay_out_view.dart';
import 'package:servival/fetures/profileView/presentation/view/edite_profile_view.dart';
import 'package:servival/fetures/profileView/presentation/view/profile_view.dart';

import '../../fetures/ExploreView/presentation/view/ExploreView.dart';
import '../../fetures/profileView/presentation/viewModel/profile_cubit.dart';

class NameRout{
  static const String splashView='/';
  static const String logInView='/logInView';
  static const String registerView='/registerView';
  static const String homeLayOut='/homeLayOut';
  static const String profileview='/profileView';
  static const String changePassword='/changePassword';
  static const String ExploreView='/ExploreView';
  static const String donatian='/donatian';
  static const String editeProfileView='/editeProfileView';
}


class NavigationManager{
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case NameRout.logInView:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context)=>getIt.get<SignInCubit>(),
            child: const SignInView()));
      case NameRout.editeProfileView:
        return MaterialPageRoute(builder: (_)=>const EditeProfileView());
      case NameRout.registerView:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt.get<SignUpCubit>(),
            child: const SignUpView()
        ));
      case NameRout.homeLayOut:
        return MaterialPageRoute(builder: (_) => const HomeLayOut(),

        );
        case NameRout.donatian:
        return MaterialPageRoute(builder: (_) => const DonateView(),

        );
        case NameRout.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView(),

        ); case NameRout.ExploreView:
        return MaterialPageRoute(builder: (_) => const ExploreView(),

        ); case NameRout.profileview:
        return MaterialPageRoute(builder: (_) => const ProfileView()
        );
    }
    return noFoundRoute();

  }
  static Route<dynamic> noFoundRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('NO FOUND ROUT'),
          ),
        ));
  }
}