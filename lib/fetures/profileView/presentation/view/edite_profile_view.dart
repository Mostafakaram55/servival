
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';

import '../widgets/edite_profile_view_boody.dart';

class EditeProfileView extends StatelessWidget {
  const EditeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back,
            color: Theme.of(context).disabledColor,
          ),
        ),
        elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title:  Text(
           'Edit Profile',
           textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
            fontSize: 25.sp,
             fontWeight: FontWeight.w600,
              color:Theme.of(context).disabledColor
             ),
          ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const EditeProfileViewBody(),
    );
  }
}
