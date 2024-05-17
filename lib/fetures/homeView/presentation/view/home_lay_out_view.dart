
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import '../../../RecieveView/presentation/viewModel/cubit/Receive_Blood_Request_cubit.dart';
import '../../../donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';
import '../viewModel/button_bar_cubit/cubit.dart';
import '../viewModel/button_bar_cubit/states.dart';
class HomeLayOut extends StatefulWidget {
  const HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  @override
  void initState() {
    ProfileCubit.get(context).getUserData();
    RequestDonationCubit.get(context).getUserDonations();
    RequestDonationCubit.get(context).getPostsForCurrentUser();
    ReceiveBloodRequestCubit.get(context).getReceiveBloodRequests();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ButtonBarCubit(),
      child: BlocBuilder<ButtonBarCubit,BottomState>(
        builder: (context,state){
          var cubit=ButtonBarCubit.get(context);
          return Scaffold(
            body:cubit.screen[cubit.currentIndex],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottomNavigationBar:  SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(12.sp),
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: ColorManager.buttonColor,
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.buttonColor.withOpacity(0.3),
                          offset: const Offset(0, 20),
                          blurRadius: 20.r,
                        ),
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(cubit.items.length, (index) =>
                          GestureDetector(
                            onTap: (){
                              cubit.changeState(index);
                            },
                            child:Padding(padding: EdgeInsets.all(8.sp),
                              child: SizedBox(
                                height: 36.h,
                                width: 36.w,
                                child: Image.asset(
                                  cubit.items[index],
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
