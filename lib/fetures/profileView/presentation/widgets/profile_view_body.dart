
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/fetures/Auth_view/data/model/user_model.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_states.dart';
import 'package:servival/fetures/profileView/presentation/widgets/person_image_and_name_profile.dart';
import 'package:servival/fetures/profileView/presentation/widgets/profile_form_item.dart';
import '../../../../core/resourses/network/controllers.dart';
import '../../../../core/resourses/shimmer/profile_shimmer.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    BlocProvider(create: (context)=>ProfileCubit()..getUserData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      child:  BlocBuilder<ProfileCubit,ProfileCubitStates>(
        builder: (context, state) {
          UserModel? model=ProfileCubit.get(context).userModel;
          if(state is ProfileCubitSuccessStates){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  ImageAndNameProfile(
                     name:model!.name ,
                     email: model.email,
                   ),
                  SizedBox(height: 30.h,),
                  ProfileItemForm(
                    title: 'User Name',
                    textEditingController: userNameProfileController,
                    dataForm: model.name,
                  ),
                  SizedBox(height: 15.h,),
                  ProfileItemForm(
                    title: 'Phone',
                    textEditingController: phoneNumberProfileController,
                    dataForm: model.phone,
                  ),
                  SizedBox(height: 15.h,),
                  ProfileItemForm(
                    title: 'Age',
                    textEditingController: ageProfileController,
                    dataForm: model.age.toString(),
                  ),
                  SizedBox(height: 15.h,),
                  ProfileItemForm(
                    title: 'Blood Type',
                    textEditingController: bloodTypeProfileController,
                    dataForm: model.bloodType,
                  ),
                ],
              ),
            );
          }else if(state is ProfileCubitErrorStates){
            return Text(state.error.toString());
          }else{
            return const Center(child: ProfileShimmer());
          }
        },
      ),
    );
  }
}
