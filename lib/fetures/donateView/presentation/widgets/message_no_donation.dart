
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';

class NoOpenDonation extends StatelessWidget {
  const NoOpenDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height:100.h ,
            width: 100.w,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/icons8-lock-100.png',
                ),
              )
            ),
          ),
          SizedBox(height: 30.h,),
          CustomTextApp(
              text: 'you can’t donate until the 120 days pass',
              textTheme: getBoldStyle(
                  color:Theme.of(context).disabledColor,
                fontSize: 30.sp,
              ),
          ),
        ],
      ),
    );
  }
}
