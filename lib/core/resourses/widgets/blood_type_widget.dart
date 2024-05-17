
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManager.buttonColor
      ),
      child:Center(
        child: CustomTextApp(
          text: 'A+',
          textTheme: getBoldStyle(
              color: Colors.white,
            fontSize: FontSize.s20.sp
          ),
        ),
      ) ,
    );
  }
}
