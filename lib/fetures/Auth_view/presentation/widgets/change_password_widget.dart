
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/core/resourses/widgets/custom_text_form_filed.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/custom_buttom.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/network/controllers.dart';
import '../view-model/cubits/signIn_cubit.dart';
import '../view-model/states/signIn_states.dart';


class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SignInCubit,SignInstates>(
      listener: (context, state) {
        if(state is ResetPasswordLoading){
          showDialog(
            context: context,
            builder: (context){
              return  const Center(child: CircularProgressIndicator());
            },
          );
        }else if(state is ResetPasswordSuccess){
          Fluttertoast.showToast(
              msg: 'A password recovery link has been sent to your email',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: SignInCubit.get(context).formKeyResetPassword,
          child: Padding(
            padding:  EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,),
                CustomTextApp(
                    text: 'Reset Password',
                    textTheme: getLightStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 22.sp
                    )
                ),
                SizedBox(height: 30.h,),
                CustomTextFormFiled(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                    hintText: 'example@gmail.com',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Message,
                    textEditingController: resetPassword,
                    textInputType: TextInputType.emailAddress
                ),
                SizedBox(height: 25.h,),
                GestureDetector(
                  onTap: (){
                    if( SignInCubit.get(context).formKeyResetPassword.currentState!.validate()){
                      SignInCubit.get(context).resetPassword(email:resetPassword.text);
                    }else{
                       'Please enter email';
                    }
                  },
                  child: const CustomButton(
                      title: 'Continue'
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
