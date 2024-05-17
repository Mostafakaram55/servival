
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/navigation_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';

class CreateAccountNow extends StatelessWidget {
  const CreateAccountNow({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        CustomTextApp(
            text: 'Don\'t have an account ?',
            textTheme: getRegularStyle(color: Theme.of(context).disabledColor,fontSize: FontSize.s16)
        ),
        SizedBox(width: 8.w,),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, NameRout.registerView);
          },
          child: CustomTextApp(
              text: 'Create account now',
              textTheme: getRegularStyle(color: ColorManager.buttonColor,fontSize: FontSize.s14)
          ),
        ),
      ],
    );
  }
}
