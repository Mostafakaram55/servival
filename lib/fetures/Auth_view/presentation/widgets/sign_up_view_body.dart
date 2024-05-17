
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/icons_app.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/core/resourses/widgets/custom_text_form_filed.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/cubits/sign_up_cubits.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/custom_buttom.dart';
import 'drob_down_buttom.dart';
import 'sign_up_lisener.dart';
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isObscureTextC=true;
  bool isObscureText=true;
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
        child: Form(
          key: context.read<SignUpCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:  Icon(
                          IconBroken.Arrow___Left_2,
                        color: Theme.of(context).disabledColor
                      )
                  ),
                  CustomTextApp(
                      text: 'Sign Up',
                      textTheme: getBoldStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: FontSize.s30),
                  ),
                ],
              ),
              SizedBox(height:15.h ,),
              const DropDownButton(),
              SizedBox(height:15.h ,),
              CustomTextFormFiled(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                  hintText: 'User Name',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Profile,
                  textEditingController: context.read<SignUpCubit>().userNameController,
                  textInputType: TextInputType.text
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Message, textEditingController: context.read<SignUpCubit>().registerEmailController,
                  textInputType: TextInputType.emailAddress
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                maxLines: 1,
                obscureTextValue:isObscureText ,
                suffixIcon: GestureDetector(
                  onTap: (){
                    setState(() {
                      isObscureText=!isObscureText;
                    });
                  },
                  child :Icon(
                    isObscureText?Icons.visibility_off_outlined: Icons.visibility_outlined,
                    color: ColorManager.buttonColor,
                  ),
                ),
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  hintText: 'Password',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Lock, textEditingController:context.read<SignUpCubit>().registerPasswordController,
                  textInputType: TextInputType.visiblePassword
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                maxLines: 1,
                obscureTextValue: isObscureTextC,
                suffixIcon:  GestureDetector(
                  onTap: (){
                    setState(() {
                      isObscureTextC=!isObscureTextC;
                    });
                  },
                  child :Icon(
                    isObscureTextC?Icons.visibility_off_outlined: Icons.visibility_outlined,
                  color: ColorManager.buttonColor,
                ),
                ),
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your confirm Password';
                    }else if(value.length<8){
                      return 'Password is too short';
                    }else if(context.read<SignUpCubit>().registerPasswordController.text!=context.read<SignUpCubit>().registerConformPasswordController.text){
                      return 'A password is not the same';
                    }
                    return null;
                  },
                  hintText: 'Confirm Password',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Lock, textEditingController: context.read<SignUpCubit>().registerConformPasswordController,
                  textInputType: TextInputType.visiblePassword
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                  hintText: 'Phone',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Call, textEditingController:context.read<SignUpCubit>().phoneController,
                  textInputType: TextInputType.phone
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  hintText: 'Age',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Document,
                  textEditingController: context.read<SignUpCubit>().ageController,
                  textInputType: TextInputType.number
              ),
              SizedBox(height: 15.h,),
              CustomTextFormFiled(
                  validate: (value){
                   if(value!.isEmpty){
                     return 'Please enter your location';
                   }
                   return null;
                  },
                  hintText: 'Location',
                  colorHintText:ColorManager.gray,
                  icon: IconBroken.Location,
                  textEditingController: context.read<SignUpCubit>().locationController,
                  textInputType: TextInputType.streetAddress
              ),
              const SignUpistener(),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: (){
                  validationDataINRegister(context);
                },
                  child: const CustomButton(title: 'Sign Up')
              ),
            ],
          ),
        ),
      ),
    );
  }
  void validationDataINRegister(BuildContext context){
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().register(
        password: context.read<SignUpCubit>().registerPasswordController.text,
        email: context.read<SignUpCubit>().registerEmailController.text,
      );
    }
  }
}
