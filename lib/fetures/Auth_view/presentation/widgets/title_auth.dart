
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key, required this.titleAuth, required this.subTitleAuth});
final String titleAuth;
final String subTitleAuth;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextApp(
            text:titleAuth,
            textTheme: getBoldStyle(
                color: Theme.of(context).disabledColor,
                fontSize: FontSize.s35
            )
        ),
        SizedBox(height: 10.h,),
        CustomTextApp(
          text: subTitleAuth,
          textTheme: getRegularStyle(
              color: Colors.grey,
              fontSize: FontSize.s15
          ),
        ),
      ],
    );
  }
}
