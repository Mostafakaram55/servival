
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servival/core/resourses/widgets/custom_text_form_filed.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/widgets/drop_down_button_form.dart';
import '../../../Auth_view/presentation/widgets/custom_buttom.dart';
import '../viewModel/cubit/Receive_Blood_Request_cubit.dart';
import '../viewModel/states/Receive_Blood_Request_states.dart';

class RecieveFormFiled extends StatefulWidget {
  const RecieveFormFiled({super.key});

  @override
  State<RecieveFormFiled> createState() => _RecieveFormFiledState();
}

class _RecieveFormFiledState extends State<RecieveFormFiled> {

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<ReceiveBloodRequestCubit,ReceiveBloodRequestStates>(
      listener:(context, state) {
        if(state is ReceiveBloodRequestLoadingState){
          showDialog(
            context: context,
            builder: (context)=>Center(
              child: CircularProgressIndicator(
                color: ColorManager.buttonColor,
              ),
            ),
          );
        }else if(state is ReceiveBloodRequestSuccessState){
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: state.messageSuccess.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pop(context);
        }else if(state is ReceiveBloodRequestErrorState){
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: state.errorMessage.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 18.sp
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
       return SafeArea(
          child: Form(
            key: context.read<ReceiveBloodRequestCubit>().formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                CustomTextFormFiled(
                    validate: (value)=>value!.isEmpty?'please enter name':null,
                    hintText: 'Patient name ',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Profile,
                    textEditingController: context.read<ReceiveBloodRequestCubit>().patientNameController,
                    textInputType: TextInputType.name
                ),
                SizedBox(height: 18.h,),
                CustomTextFormFiled(
                    validate: (value)=>value!.isEmpty?'please enter age':null,
                    hintText: 'Patient age ',
                    colorHintText: Colors.grey,
                    icon: IconBroken.User,
                    textEditingController: context.read<ReceiveBloodRequestCubit>().patientAgeController,
                    textInputType: TextInputType.number
                ),
                SizedBox(height: 18.h,),
                CustomTextFormFiled(
                    validate: (value)=>value!.isEmpty?'please enter location':null,
                    hintText: 'Patient location ',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Location,
                    textEditingController:context.read<ReceiveBloodRequestCubit>().patientLocationController,
                    textInputType: TextInputType.streetAddress
                ),
                SizedBox(height: 18.h,),
                CustomTextFormFiled(
                  validate: (value)=>value!.isEmpty?'please enter data in filed':null,
                  maxLines: 10,
                  hintText: 'Why do you need blood? ',
                  colorHintText: Colors.grey,
                  icon: IconBroken.Document,
                  textEditingController:context.read<ReceiveBloodRequestCubit>().needBloodController,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 18.h,),
                CustomTextFormFiled(
                    validate: (value)=>value!.isEmpty?'please enter data in filed':null,
                    hintText: 'Type names of medicines that patient take',
                    colorHintText: Colors.grey,
                    icon: IconBroken.Edit,
                    textEditingController:context.read<ReceiveBloodRequestCubit>().namesOfMedicinesController,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 18.h,),
                CustomDropDownButtonFormFiled(
                  onChange:(value){
                    context.read<ReceiveBloodRequestCubit>().chooseBloodType=value;
                  } ,
                  validator:(value)=>value==null?'Please enter blood type? ':null,
                  title: 'Select blood type need?',
                  listValue: context.read<ReceiveBloodRequestCubit>().bloodType,
                ),
                SizedBox(height: 18.h,),
                CustomDropDownButtonFormFiled(
                  onChange:(value){
                    context.read<ReceiveBloodRequestCubit>().chooseBloodBags=value;
                  } ,
                  validator:(value)=>value==null?'Please enter bags number':null,
                  title: 'How many blood bags need?',
                  listValue: context.read<ReceiveBloodRequestCubit>().bloodBagsList,
                ),
                SizedBox(height: 18.h,),
                CustomDropDownButtonFormFiled(
                  onChange:(value){
                    context.read<ReceiveBloodRequestCubit>().chooseRelation=value;
                  },
                  validator: (value)=>value==null?'Please enter data in filed':null,
                  title: 'Mention your relation with the patient',
                  listValue: context.read<ReceiveBloodRequestCubit>().relationsList,
                ),
                SizedBox(height: 25.h,),
                GestureDetector(
                  onTap: (){
                    if(ReceiveBloodRequestCubit.get(context).formKey.currentState!.validate()){
                      context.read<ReceiveBloodRequestCubit>().receiveBloodRequests(
                        uId: ProfileCubit.get(context).userModel!.uId,
                        name: ProfileCubit.get(context).userModel!.name,
                      ).then((value) {
                        context.read<ReceiveBloodRequestCubit>().userPostsData=[];
                        context.read<ReceiveBloodRequestCubit>().getReceiveBloodRequests();
                      });
                    }
                  },
                  child: const CustomButton(
                      title: 'Confirm'
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
