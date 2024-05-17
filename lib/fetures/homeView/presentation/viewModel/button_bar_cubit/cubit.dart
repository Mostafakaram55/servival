
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servival/fetures/donateView/presentation/view/donateView.dart';
import 'package:servival/fetures/track_view/presentation/view/trackView.dart';
import 'package:servival/fetures/homeView/presentation/viewModel/button_bar_cubit/states.dart';


import '../../../../RecieveView/presentation/view/RecieveView.dart';
import '../../../../profileView/presentation/view/profile_view.dart';
import '../../../../ExploreView/presentation/view/ExploreView.dart';

class ButtonBarCubit extends Cubit<BottomState>{
  ButtonBarCubit(): super(BottomInitialSate());
  static ButtonBarCubit get(BuildContext context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screen=[
    const DonateView(),
    const  RecieveView(),
    const TrackView(),
    const ExploreView(),
   const ProfileView(),

  ];
  final List<String>items = [
    'assets/images/Donate.png',
    'assets/images/Recieve.png',
    'assets/images/track.png',
    'assets/images/exploer.png',
    'assets/images/icons8-person-50.png',
  ];

  void changeState(int index){
    currentIndex=index;
    emit(BottomChangeSate());
  }

}