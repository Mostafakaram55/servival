
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';


import 'package:servival/fetures/donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/widgets/shimer_list_view.dart';
import '../../../../core/resourses/widgets/user_item.dart';

import '../../data/model/donation_model.dart';
import '../view_model/states/donation_states/requste_donation_states.dart';
class DonateViewBody extends StatefulWidget {
  const DonateViewBody({super.key});

  @override
  State<DonateViewBody> createState() => _DonateViewBodyState();
}
class _DonateViewBodyState extends State<DonateViewBody> {
  TextEditingController controller=TextEditingController();
  List<DonationModel> requestDonations=[];
  @override
  Widget build(BuildContext context) {
    List<DonationModel> searchFinal=[];
    searchFinal=RequestDonationCubit.get(context).userPostsData;
    return  CustomScrollView(
     slivers: [
       SliverToBoxAdapter(
         child: SizedBox(height: 10.h,),
       ),
      SliverToBoxAdapter(
        child: Padding(
          padding:  EdgeInsets.all(15.sp),
          child: SizedBox(
            height: 50.h,
            child: TextField(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400
              ),
              onChanged:(String value){
                requestDonations=RequestDonationCubit.get(context).searchQuery(
                  donationList:searchFinal ,
                  searchItem: controller.text,
                );
              },
              controller:controller,
              onSubmitted:(String value){
                requestDonations=RequestDonationCubit.get(context).searchQuery(
                  donationList: searchFinal,
                  searchItem: controller.text,
                );
              },
              decoration:InputDecoration(
                hintText:'Search for blood type',
                hintStyle:  TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  fontSize: 16.sp
                ),
                suffixIcon:GestureDetector(
                  onTap: (){
                    setState(() {
                      controller.clear();
                    });
                  },
                  child:  Icon(
                    IconBroken.Delete,
                    color: ColorManager.buttonColor,
                    size: 18.sp,
                  ),
                ) ,
                prefixIcon: Icon(
                  IconBroken.Search,
                  color: Colors.grey,
                  size: 18.sp,
                ),
                filled:true,
                fillColor: Theme.of(context).cardColor,
                enabledBorder:OutlineInputBorder(
                  borderSide:const BorderSide(color:Colors.transparent),
                  borderRadius: BorderRadius.circular(20.sp),

                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(color:Theme.of(context).disabledColor),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
         child: SizedBox(height: 10.h,),
       ),
       SliverToBoxAdapter(
         child: BlocBuilder<RequestDonationCubit,RequestDonationStates>(
           builder: (context, state) {
             if(state is RequestDonationGetPostsSuccessStates||state is searchINDonationChangValueStates){
              return ListView.separated(
                   separatorBuilder: (context,index)=>SizedBox(height: 8.h,),
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:controller.text.isNotEmpty?requestDonations.length:RequestDonationCubit.get(context).userPostsData.length,
                   itemBuilder: (context,index)=> UserItem(
                     donationModel:controller.text.isNotEmpty?requestDonations[index]:RequestDonationCubit.get(context).userPostsData[index],
                   )
               );
             } else if( state is RequestDonationGetPostsErrorStates){
               return  SizedBox(
                 child: Text(
                     state.errorMessage.toString()
                 ),
               );
             }else{
               return const ShimmerListView(
                 itemCount: 15,
               );
             }
           },
         ),
       ),
     ],
    );
  }
}
