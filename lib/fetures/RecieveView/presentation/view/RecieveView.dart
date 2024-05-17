
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/icons_app.dart';

import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';
import '../widgets/RecieveView_body.dart';
import 'Blood_ Request_view.dart';

class RecieveView extends StatelessWidget {
  const RecieveView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Recipients',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color:Theme.of(context).disabledColor
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context)=>const BloodRequestView()
          );
        },
        backgroundColor: ColorManager.buttonColor,
        child: const Icon(
          IconBroken.Add_User,
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const RecieveViewBody(),
    );
  }
}
