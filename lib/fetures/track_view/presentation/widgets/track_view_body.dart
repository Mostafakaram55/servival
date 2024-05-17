
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/fetures/donateView/presentation/view_model/states/donation_states/requste_donation_states.dart';
import '../../../donateView/presentation/view_model/cubits/donation_cubits/request_donation_cubit.dart';

class TrackViewBody extends StatefulWidget {
  const TrackViewBody({super.key});

  @override
  State<TrackViewBody> createState() => _TrackViewBodyState();
}

class _TrackViewBodyState extends State<TrackViewBody> {
  @override
  void initState() {

     RequestDonationCubit.get(context).userPostsData;
     RequestDonationCubit.get(context).getPostsForCurrentUser();
    RequestDonationCubit.get(context).checkData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDonationCubit,RequestDonationStates>(
      builder: ( context,  state) {
        var cubit=RequestDonationCubit.get(context);
        // DateTime date1=DateTime.now();
        // String? date2;
        // dynamic difference;
        // double? timeDonation;
        // if(RequestDonationCubit.get(context).userPostsData.isNotEmpty){
        //   date2 = RequestDonationCubit.get(context).postsForCurrentUser[RequestDonationCubit.get(context).postsForCurrentUser.length-1].dataTime;
        //   DateTime dateFinal = DateTime.parse(date2!);
        //   difference = date1.difference(dateFinal);
        //   num value=120-difference.inDays;
        //   timeDonation=value.toDouble();
        // }
        return RequestDonationCubit.get(context).postsForCurrentUser.isNotEmpty?Center(
          child: CircularPercentIndicator(
            radius:150.r,
            animation: true,
            animationDuration: 120,
            lineWidth: 20.0,
            percent:cubit.timeDonation==null?0.0:cubit.timeDonation!/120.toDouble(),
            center:Padding(
              padding:  EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  if(RequestDonationCubit.get(context).postsForCurrentUser.isNotEmpty)...{
                    Text(
                      'You can donate after: ',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.blueGrey
                      ),
                    ),
                    Text(
                      '${120 -cubit.difference.inDays} days',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.blueGrey
                      ),
                    ),
                  }else if(RequestDonationCubit.get(context).postsForCurrentUser.isEmpty)...{
                    Text(
                      'You can donate Now',
                      style:  TextStyle(
                          fontSize: 19.sp,
                          color: Colors.blueGrey
                      ),
                    ),
                  },
                ],
              ),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.grey,
            progressColor:ColorManager.buttonColor,
          ),
        ): Center(
          child: CircularPercentIndicator(
            radius:150.r,
            animation: true,
            animationDuration: 120,
            lineWidth: 20.0,
            percent:0.0,
            center:Padding(
              padding:  EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'You can donate  now',
                    style: TextStyle(
                        fontSize: 19.sp,
                        color: Colors.blueGrey
                    ),
                  ),
                ],
              ),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.grey,
            progressColor:ColorManager.buttonColor,
          ),
        );
      },
    );
  }
}
