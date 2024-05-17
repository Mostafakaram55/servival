
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servival/core/resourses/icons_app.dart';
import 'package:servival/core/resourses/widgets/custom_text_form_filed.dart';
import 'package:servival/fetures/donateView/presentation/view_model/states/donation_states/requste_donation_states.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/widgets/drop_down_button_form.dart';
import '../../../Auth_view/presentation/widgets/custom_buttom.dart';
import '../../../profileView/presentation/viewModel/profile_cubit.dart';
import '../view_model/cubits/donation_cubits/request_donation_cubit.dart';
class DonationRequestForms extends StatefulWidget {
   DonationRequestForms({super.key});

  @override
  State<DonationRequestForms> createState() => _DonationRequestFormsState();
}

class _DonationRequestFormsState extends State<DonationRequestForms> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RequestDonationCubit,RequestDonationStates>(
      listener: (context, state) {
        if(state is RequestDonationLoadingStates){
          showDialog(
            context: context,
            builder: (context)=>Center(
              child: CircularProgressIndicator(
                color: ColorManager.buttonColor,
              ),
            ),
          );
        }else if( state is RequestDonationSuccessStates){
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: state.successMessage.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pop(context);
        }else if(state is RequestDonationErrorStates){
          Fluttertoast.showToast(
              msg: state.errorMessage.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorManager.buttonColor,
              textColor: Colors.white,
              fontSize: 18.sp
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: RequestDonationCubit.get(context).formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormFiled(
                    validate: (value)=>value==null?'Please enter Location':null,
                    hintText: 'Location',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Location,
                    textEditingController:context.read<RequestDonationCubit>().donationRequestLocationController,
                    textInputType: TextInputType.streetAddress,
                  ),
                  SizedBox(height: 18.h,),
                  CustomDropDownButtonFormFiled(
                    validator:(value)=>value==null?'please select  yes / no':null,
                    title:'have you donated before?' ,
                    onChange: (value){
                      RequestDonationCubit.get(context).donateBefore=value;
                    },
                    listValue:RequestDonationCubit.get(context).choseItem,
                  ),
                  SizedBox(height: 18.h,),
                  TextFormField(
                    validator: (value){
                      if(RequestDonationCubit.get(context).donateBefore=='yes') {
                        if (value!.isEmpty){
                          return 'Please select last date';
                        }
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontSize: FontSize.s18.sp,
                        color: Theme.of(context).disabledColor
                    ),
                    controller: context.read<RequestDonationCubit>().dateController,
                    readOnly: true,
                    onTap: (){
                      context.read<RequestDonationCubit>().openDatePicker(context);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      hintText:'if yes, please mention the last time date' ,
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: FontSize.s16
                      ),
                      prefixIcon:Icon(
                        IconBroken.Calendar,
                        color: Theme.of(context).disabledColor,
                        size: 25.sp,
                      ) ,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color:ColorManager.error, width: 1.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Theme.of(context).disabledColor, width: 1.w),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color:ColorManager.error, width: 1.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h,),
                  CustomDropDownButtonFormFiled(
                    validator: (value){
                      if(RequestDonationCubit.get(context).donateBefore=='yes'){
                        if(value!.isEmpty){
                          return 'Please mention number of times ';
                        }
                      }
                      return null;
                    },
                    onChange: (value){
                      RequestDonationCubit.get(context).numberOfTimes=value;
                    },
                    title:'if yes,please mention the number of times?' ,
                    listValue:RequestDonationCubit.get(context).listOfTimesNumber ,
                  ),
                  SizedBox(height: 18.h,),
                  CustomDropDownButtonFormFiled(
                    validator: (value)=>value==null?'Please enter disease':null,
                    onChange: (value){
                      RequestDonationCubit.get(context).haveAnyDisease=value;
                    },
                    title: 'do you have any disease?',
                    listValue:RequestDonationCubit.get(context).choseItem ,
                  ),
                  SizedBox(height: 18.h,),
                  CustomTextFormFiled(
                      validate: (value){
                        if(RequestDonationCubit.get(context).haveAnyDisease=='yes'){
                          if(value!.isEmpty){
                            return 'Please mention the disease';
                          }
                        }
                        return null;
                      },
                      hintText: 'if yes, please mention the disease?',
                      colorHintText: Colors.grey,
                      icon: IconBroken.Document,
                      textEditingController:context.read<RequestDonationCubit>().endFormInDonationRequest,
                      textInputType: TextInputType.text
                  ),
                  SizedBox(height: 18.h,),
                  GestureDetector(
                     onTap: (){
                    if( RequestDonationCubit.get(context).formKey.currentState!.validate()){
                      context.read<RequestDonationCubit>().addDonationRequest(
                        uId: ProfileCubit.get(context).userModel!.uId,
                        name: ProfileCubit.get(context).userModel!.name,
                        bloodType: ProfileCubit.get(context).userModel!.bloodType,
                      ).then((value){
                        context.read<RequestDonationCubit>().userPostsData=[];
                      context.read<RequestDonationCubit>().getUserDonations();
                  });
                }},
                    child: const CustomButton(
                  title: 'Confirm'
              ),
             ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
