
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';

class SignInInOtherMethods extends StatelessWidget {
  const SignInInOtherMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: CustomTextApp(
            text: 'Or',
            textTheme: getSemiBoldStyle(
                color: Theme.of(context).disabledColor,
                fontSize: FontSize.s20.sp
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Bootstrap.google,size: 35.sp,
              color: Theme.of(context).disabledColor,
            ),
            SizedBox(width: 30.w,),
            Icon(
                Bootstrap.phone,size: 35.sp,
              color: Theme.of(context).disabledColor,
            ),
          ],
        ),
      ],
    );
  }
}
