
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/navigation_manager.dart';
import '../../../../core/resourses/network/app_consts.dart';
import '../../../../core/resourses/shimmer/shimmer_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(
        'assets/images/image 39.png',
        width: 100.w,
        height: 100.h,
        fit: BoxFit.fill,
        color: Colors.white,
      ),
        SizedBox(height: 10.h),
        Center(
          child: ShimmerText(
            textTitle: 'Survival Net',
            baseColor:Colors.white,
            highlightColor:ColorManager.black
          ),
        ),
      ],
    );
  }
  void nextPage(){
    Future.delayed(const Duration(seconds: 4),(){
      if(AppConsts.uIdUser.isEmpty){
        return Navigator.pushReplacementNamed(context, NameRout.logInView);
      }
      else{
        return Navigator.pushReplacementNamed(context, NameRout.homeLayOut);
      }
    }
  );
  }
}
