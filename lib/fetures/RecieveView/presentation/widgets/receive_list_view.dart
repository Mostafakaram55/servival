import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/widgets/shimer_list_view.dart';
import '../viewModel/cubit/Receive_Blood_Request_cubit.dart';
import '../viewModel/states/Receive_Blood_Request_states.dart';
import 'Receive_Blood_Request_item.dart';
class ReceiveListView extends StatelessWidget {
  const ReceiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ReceiveBloodRequestCubit,ReceiveBloodRequestStates>(
      builder: (context, state) {
        if(state is RequestBloodGetPostsSuccessStates){
          return ListView.separated(
              separatorBuilder: (context,index)=>SizedBox(height: 8.h,),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:  state.getUserPosts.length,
              itemBuilder:(context,index){
                return ReceiveBloodRequestItem(
                  receiveBloodModel: state.getUserPosts[index],
                );
              },
          );
        }else if( state is RequestBloodGetPostsErrorStates){
          return  SizedBox(
            child: Text(
                state.error.toString()
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