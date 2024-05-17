
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/navigation_manager.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/signIn_cubit.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/title_auth.dart';
import '../../../../core/resourses/shimmer/shimmer_text.dart';
import 'LogIn_Cubit_Listener.dart';
import 'creat_account_now.dart';
import 'custom_buttom.dart';
import 'emailAndPasswordWidget.dart';
import 'sigin_in_with_google_and_phone.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Center(
              child: ShimmerText(
                textTitle: 'Survival Net',
                baseColor:ColorManager.buttonColor,
                highlightColor:Theme.of(context).disabledColor,
              ),
            ),
            SizedBox(height: 30.h,),
            const TitleAuth(
              titleAuth: 'Welcome Back !',
              subTitleAuth:'Sign in to your account',
            ),
            SizedBox(height: 20.h,),
            const EmailAndPasswordWidget(),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, NameRout.changePassword);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CustomTextApp(
                    text: 'Forgot Password ?',
                    textTheme: getSemiBoldStyle(
                        color: Theme.of(context).disabledColor,
                      fontSize: FontSize.s16.sp
                    ),
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            GestureDetector(
              onTap: (){
                validationDataINRegister(context);
              },
              child: const CustomButton(
                title: 'Sign In',
              ),
            ),
            SizedBox(height: 20.h,),
            const CreateAccountNow(),
            SizedBox(height: 20.h,),
            const SignInInOtherMethods(),
            const LogInCubitListener(),
          ],
        ),
      ),
    );
  }
  void validationDataINRegister(BuildContext context){
    if(context.read<SignInCubit>().formKey.currentState!.validate()){
      context.read<SignInCubit>().logIn(
        password: context.read<SignInCubit>().passwordController.text,
        email: context.read<SignInCubit>().emailController.text,
      );
    }
  }
}
