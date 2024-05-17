
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/navigation_manager.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/fetures/profileView/presentation/widgets/profile_view_body.dart';

import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/network/cash_helper.dart';
import '../../../../core/resourses/network/change_app_mode.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:Text(
          'My Profile',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color:Theme.of(context).disabledColor
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                ChangMode.get(context).changeAppMode();
              },
              icon: Icon(EvaIcons.swap,size: 30.sp),
          ),
          IconButton(
              onPressed: (){},
              icon: IconButton(
                icon:  Icon(
                  IconBroken.Logout,
                  color: Theme.of(context).disabledColor,
                ),
                onPressed: () {
                  CashHelper.deleteData().then((value) {
                    Navigator.pushNamedAndRemoveUntil(context, NameRout.logInView, (route) => false);
                  });
                },
              )),
        ],
      ),
      body:const ProfileViewBody() ,
    );
  }
}
