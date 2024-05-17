
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/icons_app.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/change_password_widget.dart';

import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/shimmer/shimmer_text.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  ShimmerText(
          size: FontSize.s30.sp,
          textTitle: 'Survival Net',
          baseColor:ColorManager.buttonColor,
          highlightColor:Theme.of(context).disabledColor,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:  Icon(
            IconBroken.Arrow___Left,
            color: Theme.of(context).disabledColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const ChangePasswordBody(),
    );
  }
}
