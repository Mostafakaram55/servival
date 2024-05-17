import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servival/core/resourses/network/shard.dart';

import 'change_app_stats.dart';

class ChangMode extends Cubit<ChangModeState>{

  ChangMode():super(ChangInitialState());
  static ChangMode get(BuildContext context)=>BlocProvider.of(context);
  bool isDark=true;

  void changeAppMode({
    bool? fromShared,
  }){
    if(fromShared !=null){
      isDark=fromShared;
      emit(ChangModeSuccessState());
    }else{
      isDark=!isDark;
      Shared.putBoolData(key: 'isDark', value: isDark).then((value){
        emit(ChangModeSuccessState());
      });
    }
  }
}