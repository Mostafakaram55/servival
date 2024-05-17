
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/widgets/custom_text_form_filed.dart';
import '../view-model/cubits/signIn_cubit.dart';

class EmailAndPasswordWidget extends StatefulWidget {
  const EmailAndPasswordWidget({super.key});

  @override
  State<EmailAndPasswordWidget> createState() => _EmailAndPasswordWidgetState();
}

class _EmailAndPasswordWidgetState extends State<EmailAndPasswordWidget> {
   bool isObscureText=true;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            validate: (value){
              if(value!.isEmpty){
                return 'Please enter your email';
              }
              return null;
            },
            maxLines: 1,
            textInputType: TextInputType.emailAddress,
            textEditingController: context.read<SignInCubit>().emailController,
            colorHintText: Colors.grey,
            hintText: 'Email',
            icon: IconBroken.Message,
          ),
          SizedBox(height: 15.h,),
          CustomTextFormFiled(
            validate: (value){
              if(value!.isEmpty){
                return 'Please enter your password';
              }
              return null;
            },
            maxLines: 1,
            textInputType: TextInputType.visiblePassword,
            textEditingController:context.read<SignInCubit>().passwordController,
            colorHintText: Colors.grey,
            hintText: 'Password',
            icon: IconBroken.Lock,
            obscureTextValue:isObscureText,
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  isObscureText=!isObscureText;
                });
              },
              child: Icon(
                isObscureText?Icons.visibility_off_outlined: Icons.visibility_outlined,
                color: ColorManager.buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
