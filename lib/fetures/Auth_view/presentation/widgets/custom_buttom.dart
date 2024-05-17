
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: ColorManager.buttonColor,
      ),
      child: Center(
        child: CustomTextApp(
          text: title,
          textTheme: getBoldStyle(color: Colors.white,fontSize: 23.sp),
        ),
      ),
    );
  }
}
