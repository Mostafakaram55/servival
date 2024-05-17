
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText(
      {Key? key,
        required this.textTitle,
        required this.baseColor,
        required this.highlightColor,
        this.size
      })
      : super(key: key);
  final String textTitle;
  final Color baseColor;
  final Color highlightColor;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Text(
          textTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
              fontSize: size??40.sp,
              fontWeight: FontWeight.w600
          )
      ),
    );
  }
}