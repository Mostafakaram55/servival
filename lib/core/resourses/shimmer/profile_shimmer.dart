
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/shimmer_widget.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Column(
        children: [
          Row(
            children: [
              ShimmerContainerEffect(
                width: 70.w,
                height: 120.h,
                borderRadius:15.r,
              ),
              SizedBox(width: 15.w,),
              Column(
                children: [
                  ShimmerContainerEffect(
                    width: 70.w,
                    height: 35.h,
                    borderRadius:15.r,
                  ),
                  SizedBox(height: 15.h,),
                  ShimmerContainerEffect(
                    width: 80.w,
                    height: 35.h,
                    borderRadius:15.r,
                  ),

                ],
              )
            ],
          ),
           SizedBox(height: 40.w,),
          ShimmerContainerEffect(
            width: double.infinity,
            height: 50.h,
            borderRadius:15.r,
          ),
          SizedBox(height: 20.w,),
          ShimmerContainerEffect(
            width: double.infinity,
            height: 50.h,
            borderRadius:15.r,
          ),
          SizedBox(height: 20.w,),
          ShimmerContainerEffect(
            width: double.infinity,
            height: 50.h,
            borderRadius:15.r,
          ),
          SizedBox(height: 20.w,),
          ShimmerContainerEffect(
            width: double.infinity,
            height: 50.h,
            borderRadius:15.r,
          ),
        ],
      ),
    );
  }
}
