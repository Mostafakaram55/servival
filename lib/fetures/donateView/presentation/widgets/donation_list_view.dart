
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/fetures/donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';
import 'package:servival/fetures/donateView/presentation/view_model/states/donation_states/requste_donation_states.dart';
import '../../../../core/resourses/widgets/shimer_list_view.dart';
import '../../../../core/resourses/widgets/user_item.dart';
class DonationListView extends StatelessWidget {
  const DonationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RequestDonationCubit,RequestDonationStates>(
      builder: (context, state) {
        if(state is RequestDonationGetPostsSuccessStates){
            return ListView.separated(
              separatorBuilder: (context,index)=>SizedBox(height: 8.h,),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:  state.postsOfUsers.length,
              itemBuilder: (context,index)=> UserItem(
                donationModel: state.postsOfUsers[index],
              )
          );
        }else if( state is RequestDonationGetPostsErrorStates){
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
    );
  }
}
