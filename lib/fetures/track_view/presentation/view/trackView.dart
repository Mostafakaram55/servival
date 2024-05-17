
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servival/fetures/track_view/presentation/widgets/track_view_body.dart';


class TrackView extends StatelessWidget {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:  Text(
          'Track',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color:Theme.of(context).disabledColor
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const TrackViewBody(),
    );
  }
}
