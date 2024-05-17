
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/exploer_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Explore',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color:Theme.of(context).disabledColor
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(15.sp),
        child: const ExploreViewBody(),
      ),
    );
  }
}
