
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/icons_app.dart';
import 'package:servival/core/resourses/widgets/custom_text_form_filed.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/custom_buttom.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_states.dart';
import '../../../../core/resourses/network/controllers.dart';

class EditeProfileViewBody extends StatelessWidget {
  const EditeProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(20.sp),
        child: BlocConsumer<ProfileCubit,ProfileCubitStates>(
          listener: (context, state) {
            if(state is LoadingEditProfileState){
              showDialog(
                context: context,
                builder: (context){
                  return   Center(child: CircularProgressIndicator(color: ColorManager.buttonColor,));
                },
              );
            }else if(state  is SuccessEditProfileState){
              Navigator.pop(context);
              Fluttertoast.showToast(
                  msg: "Edit profile successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 18.sp
              );
            }
          },
          builder: (context, state) {
            return  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/icons8-admin-settings-male-100.png',
                          )
                      )
                  ),

                ),
                SizedBox(height: 30.h,),
                CustomTextFormFiled(
                    hintText: 'Edit user name',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController: editeUserNameProfileController,
                    textInputType: TextInputType.name
                ),
                SizedBox(height: 20.h,),
                CustomTextFormFiled(
                    hintText: 'Edit your Location',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController: editeLocationProfileController,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 20.h,),
                CustomTextFormFiled(
                    hintText: 'Edit phone number',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController: editePhoneNumberProfileController,
                    textInputType: TextInputType.number
                ),
                SizedBox(height: 20.h,),
                CustomTextFormFiled(
                    hintText: 'Edit age',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController: editeAgeProfileController,
                    textInputType: TextInputType.number
                ),
                SizedBox(height: 20.h,),
                CustomTextFormFiled(
                    hintText: 'Edit  blood type',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController: editeBloodTypeProfileController,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 40.h,),
                GestureDetector(
                  onTap: (){
                    ProfileCubit.get(context).updateUserData(
                      bloodType:editeBloodTypeProfileController.text ,
                      uId:ProfileCubit.get(context).userModel!.uId ,
                      name:editeUserNameProfileController.text,
                      location: editeLocationProfileController.text,
                      email: ProfileCubit.get(context).userModel!.email,
                      phone: editePhoneNumberProfileController.text,
                      age: editeAgeProfileController.text
                    ).then((value) {
                     Navigator.pop(context);
                    }
                    );
                  },
                  child: const CustomButton(
                      title: 'Add New Data'
                  ),
                )
              ],
            );
          },

        ),
      ),
    );
  }
}
