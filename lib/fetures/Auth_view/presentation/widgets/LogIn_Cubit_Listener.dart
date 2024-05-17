
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_dark.dart';
import 'package:servival/core/resourses/navigation_manager.dart';
import 'package:servival/core/resourses/network/app_consts.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/signIn_cubit.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/states/signIn_states.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/network/cash_helper.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';
class LogInCubitListener extends StatelessWidget {
  const LogInCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit,SignInstates>(
      listener: (context,state) {
        if (state is SuccessStateSignIn) {
          CashHelper.setDataMorePrivet(
              tokenValue: state.userCredential.user!.uid);
          AppConsts.uIdUser = state.userCredential.user!.uid;
          Fluttertoast.showToast(
              msg: "Logged in successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pushNamedAndRemoveUntil(context, NameRout.homeLayOut,(route) => false);
        } else if (state is LoadingStateSignIn) {
          showDialog(
            context: context,
            builder: (context){
              return   Center(child: CircularProgressIndicator(color:ColorManager.buttonColor,));
            },
          );
        } else if (state is ErrorStateSignIn) {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              actions:  [
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
                ),
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: CustomTextApp(
                text: 'Error Message',
                textTheme: getRegularStyle(
                  color:Colors.blueGrey,
                  fontSize: FontSize.s20.sp,
                ),
              ),
              content: CustomTextApp(
                text: state.error.toString(),
                textTheme: getLightStyle(
                  color: Theme.of(context).disabledColor,
                  fontSize: FontSize.s16.sp,

                ),
              ),
            );
          });
        }
      },
      child: const SizedBox.shrink(),
    );
  }

}
