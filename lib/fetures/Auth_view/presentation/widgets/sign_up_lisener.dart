

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/navigation_manager.dart';
import 'package:servival/core/resourses/network/app_consts.dart';
import 'package:servival/core/resourses/network/cash_helper.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/sign_up_cubits.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/states/sign_ups_states.dart';


class SignUpistener extends StatelessWidget {
  const SignUpistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpStates>(
      listener: (context,state) {
        if (state is SuccessStateSignUpStates) {
          CashHelper.setDataMorePrivet(
              tokenValue: state.userCredential.user!.uid);
          AppConsts.uIdUser = state.userCredential.user!.uid;
          print(AppConsts.uIdUser);
          Fluttertoast.showToast(
              msg: "Logged in successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pushNamedAndRemoveUntil(context, NameRout.homeLayOut, (route) => false);
        } else if (state is LoadingStateSSignUpStates) {
          showDialog(
            context: context,
              builder: (context){
              return  const Center(child: CircularProgressIndicator());
              },
          );
        } else if (state is ErrorStateSignUpStates) {
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: ColorManager.buttonColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child:  Center(
                  child: CustomTextApp(
                    text: 'Cansel',
                    textTheme: getRegularStyle(
                      color: Colors.white,
                      fontSize: FontSize.s18.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

}